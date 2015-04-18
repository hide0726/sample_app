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
   @microposts = Micropost.all.paginate(page: params[:page]) 
  end

  def articles
   @articles = Post.all.paginate(page: params[:page])
  end

  def mypage
    @user = current_user
    @microposts = @user.microposts.paginate(page: params[:page])
    @profile = @user.profile
    @sub_email = @user.subemail
  end

  private
 
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
