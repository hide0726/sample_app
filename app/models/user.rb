class User < ActiveRecord::Base
  has_many :entries,    dependent: :destroy 
  has_many :comments,   dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :contacts,   dependent: :destroy
  has_one  :profile,    dependent: :destroy
  has_one  :subemail,    dependent: :destroy
  has_many :tokens, dependent: :destroy

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]*kyoto-u.ac.jp\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # このコードは準備段階です。
    # 完全な実装は第11章「ユーザーをフォローする」を参照してください。
    Micropost.where("user_id = ?", id)
  end


  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
