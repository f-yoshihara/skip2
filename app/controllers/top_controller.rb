class TopController < ApplicationController
  def index
    set_sidebar
    # ransack
    recruitments = Recruitment.where(category: :internship).or(Recruitment.where(category: :both))
    find(recruitments)
  end

  def jobs
    set_sidebar
    recruitments = Recruitment.where(category: :employment).or(Recruitment.where(category: :both))
    find(recruitments)
  end

  def about
  end

  private
    def set_sidebar
      @occupations = Occupation.all
      @tags = ActsAsTaggableOn::Tag.all
      @tags_industry = Recruitment.tags_on(:industries)
      @tags_interst = Company.tags_on(:intesrsts)
      @recruitment_prefecture = Recruitment.select(:prefecture).distinct
      recruitments = Recruitment.all
      @published_ary = make_published_ary(recruitments)
      @url = url_for(controller: :get_photo, :id => @recruitment)
    end

    def find(recruitments)
      num_of_cards = 4
      published_recruitments = recruitments.where(status: :published)
      @q = recruitments.ransack(params[:q])

      @results = @q.result

      if params[:tag]
        @tag_name = params[:tag]
        @results = recruitments.tagged_with(@tag_name)
      end

      if params[:industry_tag]
        @tag_name = params[:industry_tag]
        @results = recruitments.tagged_with(@tag_name)
      end

      @results_of_page = @results.page(params[:page]).per(num_of_cards)
    end

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