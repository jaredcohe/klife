class User < ActiveRecord::Base
  has_secure_password
  
  # rails g model user email:string password_digest:string
  attr_accessible :email, :password, :password_confirmation
  #attr_accessor :password
  #before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create

end
