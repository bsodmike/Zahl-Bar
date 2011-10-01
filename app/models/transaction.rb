class Transaction < ActiveRecord::Base
  before_save :set_due_date
  before_save :generate_barcode

  belongs_to :customer
  belongs_to :online_shop
  
  def set_due_date
    self.due_date = 10.days.from_now.to_date
  end
  
  def generate_barcode
    self.barcode = "%013d" % Random.new.rand((10 ** 12)...(10 ** 13)) # save as string in DB
  end

  private
  def self.search_transactions(term)    
    term = "%#{term}%"
    self.where("state like ? or barcode like ?", term, term).select("distinct barcode")
  end

end
