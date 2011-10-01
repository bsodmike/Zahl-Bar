class OfflinePartner < ActiveRecord::Base
  has_many :payments
  has_many :transactions, :through => :payments
end
