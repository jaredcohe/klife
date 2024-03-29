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

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64      
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

end
