#encoding: UTF-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # ,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :token_authenticatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone,
                 :name, :gcm_regid,:gender, :birthday, :phone_first, :phone_second, :phone_third,
                 :use_policy, :personal_policy, :school, :major, :profile, :is_mento, :is_parent, :is_student,
                 :membership


  mount_uploader :profile, ImageUploader

  # token 유저 생성시 생성, 기본 cookie 생성
  before_save :ensure_authentication_token, :combine_phone

  validates :use_policy, acceptance: {accept: true}
  validates :personal_policy, acceptance: {accept: true}

  validates :email, presence: { message: "이메일을 입력해주세요." }
  validates :name, presence: {message: "이름을 입력해주세요."}
  validates :gender, presence: {message: "성별을 선택해주세요."}
  validates :birthday, presence: {message: "생년월일을 입력해주세요."}
  validates :phone, presence: {message: "전화번호를 입력해주세요."}

  # validates :use_policy, acceptance: true
  # validates :personal_policy, acceptance: true

  #----------------------------
  # like
  has_many :likes, dependent: :destroy
  # comment
  has_many :comments, dependent: :destroy
  #----------------------------

  has_many :attendships, dependent: :destroy
  has_many :dayclasses, through: :attendships

  # reply
  has_many :replies, as: :repliable

  def combine_phone
    self.phone = phone_first + phone_second + phone_third
  end

  def find_class(dayclass_id)
    attendships.collect{|attendship| attendship if attendship.dayclass_id == dayclass_id}
  end

  def classes
    attendships.collect{|attendship| attendship.dayclass }
  end

  # # email require
  # def email_required?
  #   super && phone.blank?
  # end

  # # password require
  # def password_required?
  #   super && phone.blank?
  # end

  # username = gets.chomp
  # password = gets.chomp
  # uri_str = "http://localhost:9090/plugins/userService/userservice?type=add&secret=X8Sah9Nf&username=#{username}&password=#{password}&name=#{username}"
  # uri = URI(uri_str)
  # res = Net::HTTP.get(uri)

  # puts res
end
