class BookmarksController < ApplicationController
  def new
    return @bookmark = Bookmark.new if logged_in?
    redirect_to login_url
  end

  def show
    return redirect_to login_url if not_logged_in?
    @bookmark = Bookmark.find(params[:id])
    redirect_to bookmarks_url unless @bookmark
  end

  def destroy
    return redirect_to login_url if not_logged_in?
    Bookmark.find(params[:id]).destroy
    redirect_to bookmarks_url
  end

  def create
    return redirect_to login_url if not_logged_in?
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_url
    else
      render 'new'
    end
  end

  def search
    return redirect_to login_url if not_logged_in?
    @bookmarks = Bookmark.where('title LIKE :query OR url LIKE :query OR shortening LIKE :query', query: "%#{params[:query]}%")
  end

  def index
    return redirect_to login_url if not_logged_in?
    return @bookmarks = Tag.find(params[:tag_id]).bookmarks.where(user_id: current_user) if params[:tag_id].present?

    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  private

  def bookmark_params
    params.require(:bookmark)
          .permit(:title, :url, :shortening, :user_id, :all_tags)
  end
end
