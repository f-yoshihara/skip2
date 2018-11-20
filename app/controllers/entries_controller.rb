class EntriesController < InheritedResources::Base
  before_action :set_user,  only: [:new, :show, :create, :edit, :index]
  before_action :set_entry, only: [:edit, :update, :show]
  def new
    @entry = Entry.new
    @recruitment = Recruitment.find(params[:format])
  end

  def index
    @entries = @user.entries
  end

  def create
    @recruitment = Recruitment.find(entry_params[:recruitment_id])
    @entry = Entry.new(entry_params)
    respond_to do |format|
      if @entry.save && @user.update(user_params)
        format.html { redirect_to @recruitment, notice: '応募が完了しました。' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: @entry.status == 'published' ? '応募が完了しました' : '下書きを保存しました'}
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @recruitment = @entry.recruitment
  end

  private
    def set_user
      @user = current_user
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:user_id, :recruitment_id, :status, :answer1, :answer2, :answer3, :answer4, :answer5, :agreement)
    end

    def user_params
      params.require(:entry).require(:user).permit(:name, :school_year, :school_name)
    end
end

