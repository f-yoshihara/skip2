class RecruitmentListController < ApplicationController
  def index
    @recruitments = Recruitment.all
    # @url = url_for(controller: :get_photo, :id => @recruitment)
  end
end
