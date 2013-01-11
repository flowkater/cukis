# encoding: UTF-8
class AttendshipsController < ApplicationController

	before_filter :authenticate_user!

  def new
    @dayclass = Dayclass.find(params[:dayclass_id])
    if current_user.find_class(@dayclass.id).nil?
  	  @attendship = current_user.attendships.build(params[:attendship])
    else
      flash[:notice] = "이미 신청하셨습니다."
      redirect_to @dayclass
    end
  end

  def create
  	@attendship = current_user.attendships.build(params[:attendship])
    @dayclass = Dayclass.find(params[:dayclass_id])
    @attendship.dayclass_id = @dayclass.id

  	if @attendship.save!
  		redirect_to success_dayclass_attendships_path
  	else
  		redirect_to @attendship.dayclass
  	end
  end

  def destroy
  	
  end
end