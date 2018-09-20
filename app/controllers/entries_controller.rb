class EntriesController < InheritedResources::Base
  def new
    @entry = Entry.new
    # @recruitment_id = params[:format]
    @recruitment = Recruitment.find(params[:format])
  end

  def create
    @user_id = current_user.id
    @recruitment_id = params[:format]
    @entry = Entry.new(user_id: @user_id, recruitment_id: @recruitment_id)
    if @entry.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @entry = Entry.find_by(recruitment_id: params[:format])
    @entry.destroy
  end

  private

    def entry_params
      params.require(:entry).permit(:user_id, :recruitment_id)
    end
end

