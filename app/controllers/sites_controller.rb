class SitesController < ApplicationController
  def index
    return @sites = Site.all if logged_in?

    redirect_to login_url
  end
end
