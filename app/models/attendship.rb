class Attendship < ActiveRecord::Base
	attr_accessible :user_id, :dayclass_id, :sender, :sender_phone, :sender_email

	belongs_to :user
	belongs_to :dayclass

	validates :user, :dayclass, presence: true
end

