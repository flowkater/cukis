class Message < ActiveRecord::Base
	# 최신순 정렬
	default_scope :order => 'created_at DESC'

	paginates_per 7

	attr_accessible :content

	belongs_to :note

	# Picture polymorphic
  has_many :pictures, as: :imageable

	# formatting 된 created_at
	def created_at
		created_at.strftime("%Y. %m. %d.")
	end
end
