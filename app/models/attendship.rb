#encoding: UTF-8
class Attendship < ActiveRecord::Base
	attr_accessible :user_id, :dayclass_id, :sender, :sender_phone, :sender_email, :paid

	belongs_to :user
	belongs_to :dayclass

	validates :user, :dayclass, presence: true

	validates :sender, presence: {message: "입금자 이름을 입력해주세요."}
	validates :sender_email, presence: {message: "이메일을 입력해주세요."}
	validates :sender_phone, presence: {message: "전화번호를 입력해주세요."}
end

