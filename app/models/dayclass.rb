class Dayclass < ActiveRecord::Base
	attr_accessible :title, :content, :fee, :minnumber, :maxnumber, :fromdate, :enddate, :doc, :place, :approve, :coverpic
	mount_uploader :coverpic, ImageUploader
end
