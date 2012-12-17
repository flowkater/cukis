class Note < ActiveRecord::Base
	attr_accessible :title

	paginates_per 10
	
	has_many :messages, dependent: :destroy

	# formatting created_at
	def created_at
		created_at.strftime("%Y. %m. %d.")
	end
end
