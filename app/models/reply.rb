class Reply < ActiveRecord::Base
	attr_accessible :content
	belongs_to :repliable, polymorphic: true
end
