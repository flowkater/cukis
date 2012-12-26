class MainController < ApplicationController
  def home
  	@postacts = Postact.all
  end

  def teaching
  	
  end

end
