class Article < ActiveRecord::Base
	scope :approve, where(approve: true)
	scope :spotlight, where(spotlight: true)
	attr_accessible :title, :content, :coverpic, :content, :schoolinfo_id, :approve, :spotlight
	default_scope order: 'created_at DESC'
	
	mount_uploader :coverpic, ImageUploader
	
	has_many :replies, as: :repliable
	belongs_to :schoolinfo

	def content_strip_tags
		Sanitize.clean(content)		
	end
end
