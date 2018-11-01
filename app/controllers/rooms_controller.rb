class RoomsController < ApplicationController
  def index
    @user = current_user
    @messages = Message.all
  end

  def show
    
  end
end
