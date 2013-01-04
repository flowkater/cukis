class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :school, :name,
                  :major, :profile, :phone, :phone_first, :phone_second, :phone_third, :gender,
                  :birthday, :use_policy, :personal_policy

  # token 유저 생성시 생성, 기본 cookie 생성
  before_save :ensure_authentication_token, :combine_phone

  mount_uploader :profile, ImageUploader

  validates :use_policy, acceptance: {accept: true}
  validates :personal_policy, acceptance: {accept: true}

  has_many :dayclasses, dependent: :destroy

  belongs_to :schoolinfo

  def combine_phone
    self.phone = phone_first + phone_second + phone_third
  end
end
