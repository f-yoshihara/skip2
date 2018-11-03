class FollowingsController < ApplicationController
  # before_action :set_following, only: [:index, :destroy]
  def index
    teacher_id = params[:id]
    @followings = Following.where(teacher_id: @teacher_id)
  end

  def create
    @company_id = params[:company_id]
    @following = Following.new(teacher_id: session[:teacher], company_id: params[:company_id])
    @following.save
  end

  def destroy
    @company_id = params[:company_id]
    following = Following.find(params[:id])
    following.destroy
  end

  private
  # def set_following
  #   set_teacher
  #   @following = @teacher.followings.where(company_id: params[:id])
  # end

  # def set_teacher
  #   @teacher = Teacher.find_by(session[:teacher].to_s)
  # end
end