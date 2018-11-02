class RoomsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @messages = Message.all
  end
end
