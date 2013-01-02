class Dayclass < ActiveRecord::Base
	attr_accessible :title, :content, :fee, :minnumber, :maxnumber, :fromdate, :enddate, :doc, :place, :approve
end
