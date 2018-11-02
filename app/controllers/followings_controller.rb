class FollowingsController < ApplicationController
  def index
    teacher_id = params[:id]
    followings = Following.where(teacher_id: @teacher_id)
  end

  def create
    @company_id = params[:company_id]
    following = Following.new(teacher_id: session[:teacher], company_id: params[:company_id])
    following.save
  end

  def destroy
    @company_id = params[:id]
    following = Following.find_by(company_id: params[:id])
    following.destroy
  end
end
