class Transaction < ActiveRecord::Base
  before_create :set_due_date
  before_create :generate_barcode
  before_create :amount_to_cents

  belongs_to :customer
  belongs_to :online_shop
  
  attr_accessor :amount
  
  validates_presence_of :customer_id
  validates_presence_of :online_shop_id
  validates :barcode, :uniqueness => true
  validates :amount, :numericality => true
  
  def set_due_date
    self.due_date = 10.days.from_now.to_date
  end
  
  def generate_barcode
    begin
      self.barcode = "%013d" % Random.new.rand((10 ** 12)...(10 ** 13))
    end while Transaction.exists?(:barcode => self.barcode) 
  end

  def amount_to_cents
    self.amount_cts = "%.2f" % (amount.to_f * 100)
  end

  private
  def self.search_transactions(term)    
    term = "%#{term}%"
    self.where("state like ? or barcode like ?", term, term).select("distinct barcode")
  end

end
