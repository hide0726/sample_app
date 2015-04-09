class ArticlesController < ApplicationController


 def new
  @article = Article.new
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
   redirect_to @article
  end
 end

 def index
  @articles = Article.paginate(page: params[:page])
 end
 

 private

 def article_params
  params.require(:article).permit(:title, :abstract, :content, :category_id)
 end

end
