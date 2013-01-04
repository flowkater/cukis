class Attendship < ActiveRecord::Base
	attr_accessible :client_id, :dayclass_id

	belongs_to :client
	belongs_to :dayclass

	validates :user, :dayclass, presence: true
end

