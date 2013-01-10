#encoding: UTF-8
class Client < User
	has_many :dayclasses, dependent: :destroy

	belongs_to :schoolinfo

	validates :school, presence: { message: "학교를 입력해주세요." }
	validates :major, presence: { message: "전공을 입력해주세요." }
end