# encoding: UTF-8
class Clients::RegistrationsController < Devise::RegistrationsController
	def new
		if user_session
			flash[:notice] = "현재 로그인 중입니다."
			redirect_to root_path
		else
			super
		end
	end
end