class PostsController < ApplicationController


 def new
  @post = Post.new
 end

 def create
  @post = Post.new(post_params)
  if @post.save
   flash[:success] = "Article created!"
   redirect_to @post
  else
   render 'new'
  end
 end

 def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
 end

 def show
  @post = Post.find(params[:id])
 end

 def update
  @post = Post.find(params[:id])
  if @post.update_attributes(post_params)
   flash[:success] = "Article updated!"
   redirect_to @post
  else
   redirect_to @post
  end
 end

 

 private

 def post_params
  params.require(:post).permit(:title, :abstract, :content, :category_id)
 end

end

