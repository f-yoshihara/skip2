class EntriesController < InheritedResources::Base
  def new
    @entry = Entry.new
    # @recruitment_id = params[:format]
    @recruitment = Recruitment.find(params[:format])
  end

  def create
    @recruitment = Recruitment.find(entry_params[:recruitment_id])
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
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
      params.require(:entry).permit(:user_id, :recruitment_id, :status, :answer1, :answer2, :answer3, :answer4, :answer5 )
    end
end

