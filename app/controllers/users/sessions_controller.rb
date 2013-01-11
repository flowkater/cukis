#encoding: UTF-8
class Users::SessionsController < Devise::SessionsController
	def new
		if client_session
			flash[:notice] = "현재 로그인 중입니다."
			redirect_to root_path
		else
			super
		end
	end

	def create
		self.resource = warden.authenticate!(auth_options)
		if self.resource.type == "Client"
			sign_out(resource_name)
			flash[:notice] = "멘토로 로그인 해주세요."
			redirect_to new_client_session_path
		else
			super
		end
	end
end