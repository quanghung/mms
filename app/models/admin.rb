class Admin < ActiveRecord::Base
  has_secure_password

  before_validation ->{self.email = email.downcase}
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, 
    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}

  class << self
    def new_remember_token
      SecureRandom.urlsafe_base64
    end
  
    def encrypt token
      Digest::SHA1.hexdigest token.to_s
    end
  end

  private
  def create_remember_token
    self.remember_token = self.class.encrypt self.class.new_remember_token
  end
end
