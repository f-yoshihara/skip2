class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:edit, :update, :destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
    @company = Company.find(session[:company])
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)
    respond_to do |format|
      if @staff.save
        format.html { redirect_to recruitment_list_index_path, notice: "#{'ようこそ' + @staff.name + 'さん'}" }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
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

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def check_logined
      # sessionに:staffがあるかどうかで条件分岐
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
      # staffがなければ、、
      unless @staff
        # flashメソッドを使って現在地へのパスをredirect_toの先に渡している。
        flash[:referer] = request.fullpath
        redirect_to controller: :login, action: :index
      end
    end

    # def check_logined
    #   # sessionに:companyがあるかどうかで条件分岐
    #   if session[:company] then
    #     # begin...endで囲むと...の部分が最低一回は繰り返される。
    #     begin
    #       # 新たにインスタンスを作る
    #       @company = Company.find(session[:company])
    #     # rescueで例外処理
    #     rescue ActiveRecord::RecordNotFound
    #       reset_session
    #     end
    #   end
    #   # companyがなければ、、
    #   unless @company
    #     # flashメソッドを使って現在地へのパスをredirect_toの先に渡している。
    #     flash[:referer] = request.fullpath
    #     redirect_to controller: :login, action: :index
    #   end
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:company_id, :name, :password, :password_confirmation, :email)
    end
end
