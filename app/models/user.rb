class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone, :nickname, :gcm_regid

  # token 유저 생성시 생성, 기본 cookie 생성
  before_save :ensure_authentication_token

  # like
  has_many :likes, dependent: :destroy
  # comment
  has_many :comments, dependent: :destroy

  # email require
  def email_required?
    super && phone.blank?
  end

  # password require
  def password_required?
    super && phone.blank?
  end

  # username = gets.chomp
  # password = gets.chomp
  # uri_str = "http://localhost:9090/plugins/userService/userservice?type=add&secret=X8Sah9Nf&username=#{username}&password=#{password}&name=#{username}"
  # uri = URI(uri_str)
  # res = Net::HTTP.get(uri)

  # puts res
end
