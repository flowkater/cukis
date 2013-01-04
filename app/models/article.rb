class Article < ActiveRecord::Base
	attr_accessible :title, :content
	
	mount_uploader :coverpic, ImageUploader
	
	has_many :replies, as: :repliable
	belongs_to :schoolinfo

	def content_stip_tags
		Sanitize.clean(content)		
	end
end
