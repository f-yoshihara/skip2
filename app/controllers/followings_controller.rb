class FollowingsController < ApplicationController
  before_action :set_company_id, only: [:create, :destroy]

  def index
    @followings = Following.where(teacher_id: current_teacher.id)
  end

  def create
    @following = Following.new(teacher_id: session[:teacher], company_id: params[:company_id])
    @following.save
  end

  def destroy
    following = Following.find(params[:id])
    following.destroy
  end

  private
  def set_company_id
    @company_id = params[:company_id]
  end
end