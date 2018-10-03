class TopController < ApplicationController
  def index
    num_of_cards = 4
    @recruitments = Recruitment.all
    @occupations = Occupation.all
    @tags = ActsAsTaggableOn::Tag.all
    @published_ary = make_published_ary(@recruitments)
    @url = url_for(controller: :get_photo, :id => @recruitment)
    # ransack
    @q = Recruitment.where(status: :published).ransack(params[:q])
    @results = @q.result
    # @recruitment = @q.result(distinct: true)
    # ransackのロジック
    @results_of_page = @results.page(params[:page]).per(num_of_cards)
    # view表示のロジック
    # result_ary = @result.to_a
    # @result_public_ary = make_published_ary(result_ary).page(params[:page]).per(num_of_cards)
    # @result_public_ary = @result.page(params[:page]).per(num_of_cards)
  end

  # def tag
  #   @results = Recruitment.find

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
