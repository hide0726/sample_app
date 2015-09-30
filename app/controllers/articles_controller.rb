class ArticlesController < ApplicationController
 before_action :signed_in_user, only: [:new, :edit, :update, :destroy]
 before_action :admin_user,     only: [:new, :edit, :update, :destroy]

 def new
  @article = Article.new
 end

 def edit
  @article = Article.find(params[:id])
 end

 def create
  @article = Article.new(article_params)
  if @article.save
   flash[:success] = "Article created!"
   redirect_to @article
   if @article.koukai == 1 && @article.send_mail == 1
    users = User.all
    users.each do |user| 
     PostMailer.post_email(user, @article).deliver
    end
   end
  else
   render 'new'
  end
 end

 def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to article_path
 end

 def show
  @article = Article.find(params[:id])
 end

 def update
  @article = Article.find(params[:id])
  if @article.update_attributes(article_params)
   flash[:success] = "Article updated!"
   redirect_to @article
   if @article.koukai == 1 && @article.send_mail == 1 
    users = User.all
    users.each do |user| 
     PostMailer.post_email(user, @article).deliver
    end
   end
  else
   render 'edit'
  end
 end

 def index
  @articles = Article.where(koukai: 1).paginate(page: params[:page])
 end

 
#def category
#  @articles = Article.where(public: 1)
#  @categorized_articles_0 = @articles.where(public: 0).paginate(page: params[:page])
#  @categorized_articles_1 = @articles.where(public: 1).paginate(page: params[:page])
#  @categorized_articles_2 = @articles.where(public: 2).paginate(page: params[:page])
# end 

 private

 def article_params
  params.require(:article).permit(:title, :abstract, :content, :category_id, :koukai, :gentei, :send_mail, :image, :image_cache, :remove_image)
 end

 def admin_user
  redirect_to(root_path) unless current_user.admin?
 end


end
