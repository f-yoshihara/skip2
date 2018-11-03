class RoomsController < ApplicationController
  before_action :set_school,  only: :create
  before_action :set_chat, only: :show

  def index
    if current_teacher
      @chats = set_school.chats
    elsif current_staff
      @chats = set_company.chats
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

    def set_chat
      @chat = Chat.find(params[:id])
    end
end
