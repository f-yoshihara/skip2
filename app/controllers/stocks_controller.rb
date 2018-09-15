class StocksController < InheritedResources::Base
  def follow
    @stock = Stock.new(stock_params)
    @stock.save
  end

  private

    def stock_params
      params.require(:stock).permit(:user_id, :recruitment_id, :stock, :entry)
    end
end