class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:new, :edit, :update, :destroy]
  # GET /recruitments
  # GET /recruitments.json
  def index
    @recruitments = Recruitment.all
  end

  # GET /recruitments/1
  # GET /recruitments/1.json
  def show
  end

  # GET /recruitments/new
  def new
    @recruitment = Recruitment.new
    # occupationセレクトボックス作成用
    @occupations = Occupation.all
  end

  # GET /recruitments/1/edit
  def edit
  end

  # POST /recruitments
  # POST /recruitments.json
  def create

    @staff = Staff.find(session[:staff])
    recruitment_params['company_id'] = @staff.company_id
    @recruitment = Recruitment.new(recruitment_params)
    binding.pry

    respond_to do |format|
      if @recruitment.save
        format.html { redirect_to @recruitment, notice: 'Recruitment was successfully created.' }
        format.json { render :show, status: :created, location: @recruitment }
      else
        format.html { render :new }
        format.json { render json: @recruitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recruitments/1
  # PATCH/PUT /recruitments/1.json
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

  # DELETE /recruitments/1
  # DELETE /recruitments/1.json
  def destroy
    @recruitment.destroy
    respond_to do |format|
      format.html { redirect_to recruitments_url, notice: 'Recruitment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruitment
      @recruitment = Recruitment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recruitment_params
      params.require(:recruitment).permit(:company_id, :occupation_id, :status, :title, :body, :deadline)
    end
    # ログイン認証
    def check_logined
      # sessionに:companyがあるかどうかで条件分岐
      if session[:staff] then
        # begin...endで囲むと...の部分が最低一回は繰り返される。
        begin
          # 新たにインスタンスを作る
          @staff = Staff.find(session[:staff])
        # rescueで例外処理
        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end
      # staffがなければ
      unless @staff
        # flashメソッドを使って現在地へのパスをredirect_toの先に渡している。
        flash[:referer] = request.fullpath
        redirect_to controller: :staff_login, action: :index
      end
    end
end
