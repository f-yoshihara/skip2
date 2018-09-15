class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @stocks = @user.stocks
  end
end
