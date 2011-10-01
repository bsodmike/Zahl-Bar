class User < ActiveRecord::Base
  
  ROLES = %w()
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :name, :password, :password_confirmation, :remember_me, :role, :status
  
  def admin?
    ['admin', 'super_admin'].include? self.role
  end
  
  def super_admin?
    self.role == 'super_admin'
  end
  
  def active?
    self.status == 'active'
  end
  
end
