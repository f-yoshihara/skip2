class TopController < ApplicationController
  def index
    num_of_cards = 4
    @occupations = Occupation.all
    @tags = ActsAsTaggableOn::Tag.all
    @tags_industry = Company.tags_on(:industries)
    @tags_interst = Company.tags_on(:intesrsts)
    @recruitment_prefecture = Recruitment.select(:prefecture).distinct
    recruitments = Recruitment.all
    @published_ary = make_published_ary(recruitments)
    @url = url_for(controller: :get_photo, :id => @recruitment)
    # ransack
    @q = Recruitment.where(status: :published).ransack(params[:q])
    @results = @q.result

    if params[:tag]
      @tag_name = params[:tag]
      @results = Recruitment.tagged_with(@tag_name)
    end

    if params[:industry_tag]
      tag_name = params[:industry_tag]
      @results = Company.tagged_with(tag_name).recruitments
    end

    @results_of_page = @results.page(params[:page]).per(num_of_cards)
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

    def search_recruitments_by_tag(tag)
      tag_name = params[tag]
      Recruitment.tagged_with(tag_name)
    end
end