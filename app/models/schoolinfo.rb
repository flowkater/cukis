class Schoolinfo < ActiveRecord::Base
	attr_accessible :maintitle, :subtitle, :content, :logo, :logoband, :logocircle, :logochart,
									:approve, :shorttitle

	scope :approve, where(approve: true)

	# Image Uploader
	mount_uploader :logo, LogoUploader	
	mount_uploader :logoband, LogobandUploader
	mount_uploader :logocircle, LogocircleUploader
	mount_uploader :logochart, LogochartUploader

	has_many :articles, dependent: :destroy
	has_many :clients
end
