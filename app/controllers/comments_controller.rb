class CommentsController < ApplicationController
  before_action :signed_in_user

  def create
   @comment = current_user.comments.build(comment_params)
   if @comment.save
      flash[:success] = "Comment created!"
      redirect_to Micropost.find_by(id: @comment.micropost_id)
   else
     redirect_to Micropost.find_by(id: @comment.micropost_id)
   end
  end

  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
   redirect_to Micropost.find_by(id: @comment.micropost_id)
  end

  def show
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated!"
      redirect_to Micropost.find_by(id: @comment.micropost_id)
    else
      redirect_to Micropost.find_by(id: @comment.micropost_id)
    end
  end

 private

    def comment_params
      params.require(:comment).permit(:content, :micropost_id)
    end

end

