class RecruitmentListController < ApplicationController
  def index
    unless session[:company]
      @staff = Staff.find(session[:staff])
      @recruitments = Recruitment.where(company_id: @staff.company_id)
    else
      @recruitments = Recruitment.where(company_id: session[:company])
    end
    
    # binding.pry
  end
end
