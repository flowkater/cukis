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

	def rest_people_show
		people = rest_people
		if people == 0
			'<p id="content">마감되었습니다.</p>'
		else
			"<p id='content'>#{people}<p id='unit'> 명 남았습니다.</p></p>"
		end
	end

	def rest_people
		maxnumber - attendships.size
	end
end
