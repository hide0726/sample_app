class SubemailsController < ApplicationController
 before_action :signed_in_user, only: [:edit, :update]
 before_action :correct_user,   only: [:edit, :update, :show]

  def show
    @sub_email = Subemail.find(params[:id])
    @user = @sub_email.user
    @inform = @user.subemail.inform
  end

  def new
    @sub_email = Subemail.new
  end

  def edit
  end

  def update
    if @sub_email.update_attributes(sub_email_params)
      flash[:success] = "Sub-email updated!"
      redirect_to mypage_path
    else
      render 'edit'
    end
  end

 def create
   @sub_email = current_user.build_subemail(sub_email_params)
   if @sub_email.save
     flash[:success] = "Sub-email created!"
     redirect_to mypage_path
   else
    render 'new'
   end
  end

  def destroy
   @sub_email = Subemail.find(params[:id])
   @sub_email.destroy
    flash[:success] = "Sub-email destroyed."
    redirect_to mypage_path
  end

private

  def sub_email_params
    params.require(:subemail).permit(:sub_email, :inform)
  end


  # Before actions

  def signed_in_user
     unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
end


  def correct_user
      @sub_email = Subemail.find(params[:id])
      @user = @sub_email.user
      redirect_to(root_path) unless current_user?(@user)
  end

end


