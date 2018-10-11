class EntriesController < InheritedResources::Base
  def new
    @entry = Entry.new
    @recruitment = Recruitment.find(params[:format])
    @user = current_user
  end

  def create
    @recruitment = Recruitment.find(entry_params[:recruitment_id])
    @entry = Entry.new(entry_params)
    @user = current_user

    respond_to do |format|
      if @entry.save && @user.update(user_params)
        format.html { redirect_to @entry, notice: '応募が完了しました。' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = Entry.find_by(recruitment_id: params[:format])
    @entry.destroy
  end

  private

    def entry_params
      params.require(:entry).permit(:user_id, :recruitment_id, :status, :answer1, :answer2, :answer3, :answer4, :answer5)
    end

    def user_params
      params.require(:entry).require(:user).permit(:name, :school_year, :school_name)
    end
end

