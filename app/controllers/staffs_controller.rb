class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @company = Company.find(params[:format]) 
    @staff = Staff.new
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      reset_session
      session[:staff] = @staff.id
      redirect_to recruitment_list_index_path
    else
      redirect_to root_path
    end
  end

  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def check_logined
      if session[:staff] then
        begin
          @staff = Staff.find(session[:staff])
        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end
      unless @staff
        flash[:referer] = request.fullpath
        redirect_to controller: :login, action: :index
      end
    end

    def staff_params
      params.require(:staff).permit(:company_id, :name, :password, :password_confirmation, :email)
    end
end
