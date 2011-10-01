class Payment < ActiveRecord::Base
  before_save :locate_transaction_via_barcode

  belongs_to :offline_partner
  belongs_to :transaction
  
  attr_accessor :barcode_identifer
  
  def locate_transaction_via_barcode
    self.transaction_id = Transaction.where(:barcode => :barcode_identifer)
  end
end
