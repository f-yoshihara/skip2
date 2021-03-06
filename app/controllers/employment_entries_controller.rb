class EmploymentEntriesController < ApplicationController
  def new
    @entry = EmploymentEntry.new
    @recruitment = Recruitment.find(params[:format])
    @user = current_user
  end

  def create
    @recruitment = Recruitment.find(entry_params[:recruitment_id])
    @entry = EmploymentEntry.new(entry_params)
    @user = current_user

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

  def destroy
    @entry = EmploymentEntry.find_by(recruitment_id: params[:format])
    @entry.destroy
  end

  private

    def entry_params
      params.require(:employment_entry).permit(:user_id, :recruitment_id, :status, :answer1, :answer2, :answer3, :answer4, :answer5, :agreement)
    end

    def user_params
      params.require(:employment_entry).require(:user).permit(:name, :school_year, :school_name)
    end
end
