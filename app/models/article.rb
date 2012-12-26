class Article < ActiveRecord::Base
	attr_accessible :title, :content
	has_many :replies, as: :repliable
end
