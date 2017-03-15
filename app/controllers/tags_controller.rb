class TagsController < ApplicationController
  def index
    return @tags = Tag.all if logged_in?

    redirect_to login_url
  end
end
