class StocksController < InheritedResources::Base
  def index
    @user_id = params[:id]
    @stocks = Stock.where(user_id: @user_id)
  end

  def create
    @recruitment_id = params[:recruitment_id]
    @stock = Stock.new(user_id: current_user.id, recruitment_id: params[:recruitment_id])
    @stock.save
  end

  def destroy
    @recruitment_id = params[:id]
    @stock = Stock.find_by(recruitment_id: params[:id])
    @stock.destroy
  end
end