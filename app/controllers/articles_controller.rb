class ArticlesController < ApplicationController
 before_action :admin_user,     only: [:new, :edit, :destroy]

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
  else
   render 'edit'
  end
 end

 def index
  @articles = Article.where(public: 1).paginate(page: params[:page])
 end

 
#def category
#  @articles = Article.where(public: 1)
#  @categorized_articles_0 = @articles.where(public: 0).paginate(page: params[:page])
#  @categorized_articles_1 = @articles.where(public: 1).paginate(page: params[:page])
#  @categorized_articles_2 = @articles.where(public: 2).paginate(page: params[:page])
# end 

 private

 def article_params
  params.require(:article).permit(:title, :abstract, :content, :category_id, :public, :gentei)
 end

 def admin_user
  redirect_to(root_path) unless current_user.admin?
 end


end
