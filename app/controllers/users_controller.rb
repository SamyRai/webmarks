class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to bookmarks_url
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
