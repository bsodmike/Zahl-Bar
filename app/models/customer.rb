class Customer < ActiveRecord::Base
  has_many :transactions
  
  validates :email, :presence => true, :uniqueness => true, :email => true

end
