class Api::V1::MainController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  def check_phone
  	
  end

  def register_openfire
  	username = params[:username]
  	password = params[:password]
  	uri_str = "http://localhost:9090/plugins/userService/userservice?type=add&secret=X8Sah9Nf&username=#{username}&password=#{password}&name=#{username}"
  	uri = URI(uri_str)
 	 	res = Net::HTTP.get(uri)
 	 	res.strip!
 	 	if res == "<result>ok</result>"
 	 		render status: :created, json: {response: res}	
 	 	else
 	 		render status: :unprocessable_entity, json: {response: res}
 	 	end
  end
end