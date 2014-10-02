class User < ActiveRecord::Base
attr_accessible :code ,:firstname, :lastname ,:account ,:email,:password ,:password_confirmation

has_secure_password
validates :code ,presence: true ,length: {maximum: 50},
                            uniqueness: {case_sensitive: false }
validates :firstname, presence: true ,length: {maximum:50}
validates :lastname, presence: true ,length: {maximum: 50}
validates :account, presence: true ,length: { maximum: 50 },
                            uniqueness: {case_sensitive: false }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true ,length: { maximum: 100 },
                            format: { with: VALID_EMAIL_REGEX },
                            uniqueness: {case_sensitive: false }
before_save { self.email = email.downcase }

validates :password,presence: true ,length: {maximum:10}
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
