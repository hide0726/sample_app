class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :show, :destroy]
  before_action :correct_user,   only: [:destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
      users = User.all
      users.each do |user|
       PostMailer.bbs_post_email(current_user, user, @micropost).deliver
      end
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def edit
   @micropost = Micropost.find(params[:id])
  end


  def update
   @micropost = Micropost.find(params[:id])
   if @micropost.update_attributes(micropost_params)
      flash[:success] = "Micropost updated!"
      redirect_to @micropost
    else
      render 'edit' 
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path
  end

  def show
   @micropost = Micropost.find(params[:id])
   @entry = current_user.entries.build
   @entries = @micropost.entries
   @comment = current_user.comments.build
   @comments = @micropost.comments
  end

 private

    def micropost_params
      params.require(:micropost).permit(:content, :title)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
    end
end


