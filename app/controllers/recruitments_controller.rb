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
    @url = url_for(controller: :get_photo, :id => @recruitment)
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
    @occupations = Occupation.all
    @recruitment = Recruitment.new(recruitment_params)

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

  # def get_photo
  #   send_data @recruitment.photo, type: @recruitment.ctype, disposition: :inline
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruitment
      @recruitment = Recruitment.find(params[:id])
      @occupations = Occupation.all
      # send_data @recruitment.photo, type: @recruitment.ctype, disposition: :inline
      # binding.pry
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def recruitment_params
      # StrongParametersに指定する場合バイナリはdata
      params.require(:recruitment).permit(:company_id, :occupation_id, :status, :title, :body, :deadline, :data, :capacity, :location, :question1, :question2, :question3, :question4, :question5, :prefecture, :city, :street, :tag_list, :skill_list, :interest_list)
    end
end