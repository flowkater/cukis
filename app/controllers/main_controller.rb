class MainController < ApplicationController
  def home
  	@postacts = Postact.all
  end
end
