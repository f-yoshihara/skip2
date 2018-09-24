class TopController < ApplicationController
  def index
    @recruitments = Recruitment.all
    @occupations = Occupation.all
    @published_ary = make_published_ary(@recruitments)
    @url = url_for(controller: :get_photo, :id => @recruitment)
    # ransack
    @q = Recruitment.ransack(params[:q])
    # @recruitment = @q.result(distinct: true)
    # ransackのロジック
    @result = @q.result
    # view表示のロジック
    result_ary = @result.to_a
    @result_public_ary = make_published_ary(result_ary)
  end

  def about
  end

  private
    def make_published_ary(ary)
      new_ary = []
      ary.each do |result|
        if result.status == 'published'
          new_ary << result
        end
      end
      new_ary
    end
end
