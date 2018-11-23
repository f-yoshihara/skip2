class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:new, :edit, :update, :destroy, :index]

  def index
    @recruitments = Recruitment.where(company_id: @staff.company).order(created_at: :desc)
  end

  def show
    get_photo
  end

  def new
    @recruitment = Recruitment.new
    @occupations = Occupation.all
  end

  def edit
  end

  def create
    @occupations = Occupation.all
    @recruitment = Recruitment.new(recruitment_params)

    respond_to do |format|
      if @recruitment.save
        format.html { redirect_to @recruitment, notice: '募集要項の作成が完了しました.' }
        format.json { render :show, status: :created, location: @recruitment }
      else
        format.html { render :new }
        format.json { render json: @recruitment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recruitment.update(recruitment_params)
        format.html { redirect_to @recruitment, notice: 'Recruitment was successfully updated.' }
        format.json { render :show, status: :ok, location: @recruitment }
      else
        format.html { render :edit }
        format.json { render json: @recruitment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recruitment.destroy
    respond_to do |format|
      format.html { redirect_to recruitments_url, notice: 'Recruitment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_photo
      @url = url_for(controller: :get_photo, :id => @recruitment)
    end

    def set_recruitment
      @recruitment = Recruitment.find(params[:id])
      @occupations = Occupation.all
    end

    def check_logined
      if session[:staff]
        begin
          @staff = Staff.find(session[:staff])
        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end
      unless @staff
        flash[:referer] = request.fullpath
        redirect_to controller: :staff_login, action: :index
      end
    end

    def recruitment_params
      # StrongParametersに指定する場合バイナリはdata
      params.require(:recruitment).permit(:company_id, :occupation_id, :status, :title, :body, :culture, :deadline, :data, :capacity, :location, :question1, :question2, :question3, :question4, :question5, :prefecture, :city, :street, :tag_list, :industry_list, :skill_list, :interest_list, :schedule, :start_time, :end_time, :belongings, :clothing, :notices, :category )
    end
end