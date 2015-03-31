class StaticPagesController < ApplicationController
before_action :signed_in_user, only: [:bbs]

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def bbs
  end

private

   def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
   end

end
