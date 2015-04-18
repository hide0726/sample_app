class ProfilesController < ApplicationController
 before_action :signed_in_user, only: [:edit, :update]
 before_action :correct_user,   only: [:edit, :update]

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      redirect_to mypage_path
    else
      render 'edit'
    end
  end

  def create
   @profile = current_user.build_profile(profile_params)
   if @profile.save
     flash[:success] = "Profile created!"
     redirect_to mypage_path
   else
    render 'new'
   end
  end

  def destroy
   @profile = Profile.find(params[:id])
   @profile.destroy
    flash[:success] = "Profile destroyed."
    redirect_to mypage_path
  end


  private

  def profile_params
    params.require(:profile).permit(:shozoku, :gakukei, :self_intro)
  end


  # Before actions

  def signed_in_user
     unless signed_in?
        store_location
redirect_to signin_url, notice: "Please sign in."
      end
  end


  def correct_user
      @profile = Profile.find(params[:id])
      @user = @profile.user
      redirect_to(root_path) unless current_user?(@user)
  end

end


