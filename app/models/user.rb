class User < ActiveRecord::Base
  before_create :create_remember_token
  validates :badge,  presence: true, uniqueness: true, numericality: { only_integer: true , message: " %{value} is not a valid badge number" }, length: {is: 5, message: " Number Must Be 5 Digits" }
  has_one :ballot

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end


