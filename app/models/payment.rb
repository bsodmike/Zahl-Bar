class Payment < ActiveRecord::Base
  before_validation :check_if_barcode_exists
  before_validation :set_transaction_id
  after_create :update_transaction_state

  belongs_to :offline_partner
  belongs_to :transaction
  
  attr_accessor :barcode_identifer
  
  validates :barcode_identifer, :numericality => { :only_integer => true }
  validates :transaction_id, :uniqueness => true
  validates_presence_of :offline_partner_id
  validates_presence_of :transaction_id
  
  def update_transaction_state
    Transaction.where(:id => self.transaction_id).last.update_attribute(:state,"done")
  end
  
  def set_transaction_id
    unless Transaction.where(:barcode => self.barcode_identifer).empty?
      self.transaction_id = Transaction.where(:barcode => self.barcode_identifer).last.id
    end
  end
  
  def check_if_barcode_exists
    errors.add(" ", "Barcode does not exist!") if Transaction.where(:barcode => self.barcode_identifer).empty?
  end
end
