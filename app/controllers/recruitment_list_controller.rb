class RecruitmentListController < ApplicationController
  def index
    # @staff = Staff.where(id: session[:staff])
    @staff = Staff.find(session[:staff])
    @recruitments = Recruitment.where(company_id: @staff.company_id)
    # binding.pry
  end
end
