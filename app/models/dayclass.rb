class Dayclass < ActiveRecord::Base
	scope :approve, where(approve: true)

	attr_accessible :title, :content, :fee, :minnumber, :maxnumber, :fromdate, :enddate,:fromtime, :endtime, :doc, :place, :approve, :coverpic,
									:client_id
	mount_uploader :coverpic, ImageUploader
	has_many :replies, as: :repliable
	belongs_to :client

	has_many :attendships, dependent: :destroy
	has_many :users, through: :attendships
end