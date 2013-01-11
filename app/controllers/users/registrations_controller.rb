# encoding: UTF-8
class Users::RegistrationsController < Devise::RegistrationsController
	def new
		if client_session
			flash[:notice] = "현재 로그인 중입니다."
			redirect_to root_path
		else
			super
		end
	end
end