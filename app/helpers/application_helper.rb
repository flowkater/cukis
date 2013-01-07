module ApplicationHelper
	def agreement
		@agreement = Globalinfo.first.content.html_safe
	end

	def privacy
		@privacy = Globalinfo.find(2).content.html_safe
	end

	def introduce
		@introduce = Globalinfo.find(3).content.html_safe
	end

	def question
		@question = Globalinfo.find(4).content.html_safe
	end
end
