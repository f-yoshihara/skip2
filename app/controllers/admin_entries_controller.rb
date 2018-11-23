class AdminEntriesController < ApplicationController
  def index
    @recruitment = Recruitment.find_by(id: params[:id])
    @entries = @recruitment.entries.where(status: :published)
  end

  def show
  end
end
