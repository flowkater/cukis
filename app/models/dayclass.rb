#encoding: UTF-8
class Dayclass < ActiveRecord::Base
	has_editor_images
	scope :approve, where(approve: true)

	attr_accessible :title, :content, :fee, :minnumber, :maxnumber, :fromdate, :enddate,:fromtime, :endtime, :doc, :place, :approve, :coverpic,
									:client_id, :is_client, :client_profile, :client_schoollogo, :client_schoolname, :client_major, :client_name
	mount_uploader :coverpic, ImageUploader
	mount_uploader :client_profile, ImageUploader
	mount_uploader :client_schoollogo, LogocircleUploader
	has_many :replies, as: :repliable
	belongs_to :client

	has_many :attendships, dependent: :destroy
	has_many :users, through: :attendships

	def paid_attendships
		attendships.select { |a| a.paid == 1 }.size
	end

	def mento_profile_index
		if is_client
			client_profile.url(:index_profile)
		else
			client.profile_image
		end
	end

	def mento_profile_show
		if is_client
			client_profile.url(:show_profile)
		else
			client.profile.url(:show_profile)
		end
	end

	def mento_schoolname
		if is_client
			client_schoolname
		else
			client.school
		end
	end

	def mento_major
		if is_client
			client_major
		else
			client.major
		end
	end

	def mento_name
		if is_client
			client_name
		else
			client.name
		end
	end

	def mento_schoollogo
		if is_client
			client_schoollogo
		else
			client.schoolinfo.logocircle
		end
	end

	def rest_people_show
		people = rest_people
		unless over_enddate
			if people == 0 || people < 0
				'<p id="content">클래스 정원이 모두 찼습니다.</p>'
			else
				"<p id='content'>#{people}<p id='unit'> 명 남았습니다.</p></p>"
			end
		else
			'<p id="content">마감되었습니다.</p>'
		end
	end

	def rest_people_index
		people = rest_people
		unless over_enddate
			if people == 0 || people < 0
				'클래스 정원이 모두 찼습니다.'
			else
				"#{people} 명 남았습니다."
			end
		else
			'마감되었습니다.'
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

	def over_enddate
		if over_time <= 0
			true
		else
			false
		end
	end

	def over_time
		class_datetime - Time.now
	end

	def class_datetime
		Time.local(enddate.year, enddate.month, enddate.day, endtime.hour)
	end
end
