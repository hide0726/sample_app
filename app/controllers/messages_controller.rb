class MessagesController < ApplicationController
  before_action :signed_in_user, only: [:create, :show, :destroy]
  before_action :correct_user,   only: [:destroy]

 def create
  @message = current_user.messages.build(message_params)
  if @message.save
   flash[:success] = "Message created!"
   #相手のプロフィールページからメッセージを送った場合は相手のプロフィールページにいすわり、自分のプロフィールページからメッセージを送った場合は自分のプロフィールページに戻る。
   #redirect_back_or message_feed_path
  else
   #どうするよ。とりあえず
   #redirect_back or message_feed_path
  end

 def destroy
  @message.destroy
 end

 def show
 end

private

 def message_params
  params.require(:message).permit(:content, :receiver_id)
 end

 def correct_user
  @message = current_user.message.find_by(id: params[:id])
 end

end
