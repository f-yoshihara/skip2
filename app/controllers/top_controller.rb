class TopController < ApplicationController
  def index
    @recruitments = Recruitment.all
    @url = url_for(controller: :get_photo, :id => @recruitment)
    # ransack
    @q = Recruitment.ransack(params[:q])
    # @recruitment = @q.result(distinct: true)
    # ransackのロジック
    @result = @q.result
    # view表示のロジック
    result_ary = @result.to_a
    @result_public_ary = []
    result_ary.each do |result|
      if result.status == 'published'
        @result_public_ary << result
      end
    end
  end

  def about
  end
end
