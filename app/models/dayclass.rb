#encoding: UTF-8
class Dayclass < ActiveRecord::Base
	scope :approve, where(approve: true)

	attr_accessible :title, :content, :fee, :minnumber, :maxnumber, :fromdate, :enddate,:fromtime, :endtime, :doc, :place, :approve, :coverpic,
									:client_id
	mount_uploader :coverpic, ImageUploader
	has_many :replies, as: :repliable
	belongs_to :client

	has_many :attendships, dependent: :destroy
	has_many :users, through: :attendships

	def paid_attendships
		attendships.select { |a| a.paid == 1 }.size
	end

	def rest_people_show
		people = rest_people
		if people == 0 || people < 0
			'<p id="content">클래스 정원이 모두 찼습니다.</p>'
		else
			"<p id='content'>#{people}<p id='unit'> 명 남았습니다.</p></p>"
		end
	end

	def rest_people
		maxnumber - paid_attendships
	end

	def rest_people_ratio
		maxnumber = self.maxnumber * 1.0
		if paid_attendships <= maxnumber
			(paid_attendships / maxnumber) * 100 
		end
	end

	def attendship_status(user_id)
		paid = attendships.select {|a| a.user_id == user_id}.first.paid
		if paid == 0
			"입금 대기중"
		elsif paid == 1
			"입금 완료"
		else
			"결제 도중 오류가 발생했습니다."
		end
	end
end
