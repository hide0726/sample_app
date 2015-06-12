class ContactsController < ApplicationController


 def create
  if signed_in?
  @contact = current_user.contacts.build(contact_params)
   if @contact.save
    flash[:success] = "ご連絡ありがとうございました。"
    redirect_to root_url
    PostMailer.contact_post_email(current_user, @contact).deliver
   else
    render 'new'
   end
  else
   @contact = Contact.new(contact_params) 
   if @contact.save
    flash[:success] = "ご連絡ありがとうございました。"
    redirect_to root_url
    PostMailer.contact_post_email('非ログインユーザー', @contact).deliver
   else
    render 'new'
   end
  end
 end

 def destroy
  @contact.destroy
  redirect_to root_path
 end


 def index
  if signed_in? && current_user.admin?
   @contacts = Contact.paginate(page: params[:page])
  else
   redirect_to(root_path)
  end
 end

 def show
  @contact = Contact.find(params[:id])
 end

  
 def new
  @contact = Contact.new
 end

 private
  
  def contact_params
   params.require(:contact).permit(:user_id, :content, :name )
  end

end
