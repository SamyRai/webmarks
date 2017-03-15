class TagsController < ApplicationController
  def index
    return @tags = Tag.all if logged_in?

    redirect_to login_url
  end

  def destroy
    redirect_to login_url if not_logged_in?
    Tag.find(params[:id]).destroy
    redirect_to tags_url
  end
end
