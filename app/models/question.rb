# encoding: UTF-8
class Question < ActiveRecord::Base
	attr_accessible :name, :phone, :email, :title, :content

	validates :name, presence: {message: "이름을 입력해주세요."}
	validates :email, presence: {message: "이메일을 입력해주세요."}
	validates :title, presence: {message: "제목을 입력해주세요."}
	validates :content, presence: {message: "내용을 입력해주세요."}
end
