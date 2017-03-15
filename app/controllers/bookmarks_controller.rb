class BookmarksController < ApplicationController
  def new
    return @bookmark = Bookmark.new if logged_in?
    redirect_to login_url
  end

  def show
    redirect_to login_url if not_logged_in?
    @bookmark = Bookmark.find(params[:id])
    redirect_to bookmarks_url unless @bookmark
  end

  def create
    redirect_to login_url if not_logged_in? and return
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_url
    else
      render 'new'
    end
  end

  def index
    redirect_to login_url if not_logged_in? and return
    return @bookmarks = Tag.find(params[:tag_id]).bookmarks.where(user_id: current_user) if params[:tag_id].present?

    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  private

  def bookmark_params
    params.require(:bookmark)
          .permit(:title, :url, :shortening, :user_id, :all_tags)
  end
end
