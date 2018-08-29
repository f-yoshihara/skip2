class GetPhotoController < ApplicationController
  before_action :set_recruitment
  def index
    send_data @recruitment.photo, type: @recruitment.ctype, disposition: :inline
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end
end
