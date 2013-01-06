module ApplicationHelper
	def agreement
		@agreement = Globalinfo.first.content.html_safe
	end

	def privacy
		@privacy = Globalinfo.find(2).content.html_safe
	end
end
