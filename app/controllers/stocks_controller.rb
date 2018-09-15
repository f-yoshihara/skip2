class StocksController < InheritedResources::Base
  def create
    @user_id = current_user.id
    @recruitment_id = params[:format]
    @stock = Stock.new(user_id: @user_id, recruitment_id: @recruitment_id)
    if @stock.save
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  def destroy
    @stock = Stock.find_by(recruitment_id: params[:format])
    @stock.destroy
  end

  private

    def stock_params
      params.require(:stock).permit(:user_id, :recruitment_id)
    end
end