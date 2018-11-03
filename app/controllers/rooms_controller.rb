class RoomsController < ApplicationController
  before_action :set_school,  only: [:index, :show, :create]
  before_action :set_company, only: [:index, :show]

  def index
    if current_teacher
      @chats = @school.chats
    elsif current_staff
      @chats = @company.chats
    end
  end

  def show
    @messages = @chat.messages
  end

  def create
    chat = Chat.new(school_id: @school.id, company_id: params[:company_id])
    chat.save
  end

  private
    def set_school
      @school = current_teachers_school
    end

    def set_company
      @company = current_staffs_company
    end
end
