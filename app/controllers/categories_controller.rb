class CategoriesController < ApplicationController
before_action :signed_in_user, only: [:new, :create, :edit, :destroy] 
before_action :admin_user, only: [:new, :create, :edit, :destroy] 

 def new
  @category = Category.new
 end

 def edit
  @category = Category.find(params[:id])
 end
 
 def create
  @category = Category.new(category_params)
  if @category.save
   flash[:success] = "Category created!"
   redirect_to @category
  else
   render 'new'
  end
 end

 def update
  @category = Category.find(params[:id])
  if @category.update_attributes(category_params)
   flash[:success] = "Category updated!"
   redirect_to @category
  else
   render 'edit'
  end
 end


 def destroy
  @category = Category.find(params[:id])
  @category.destroy
  redirect_to category_path
 end

 def show
 @category = Category.find(params[:id])
 @articles = Article.where(koukai: 1)
  @categorized_articles_0 = @articles.where(category_id: 0).paginate(page: params[:page])
  @categorized_articles_1 = @articles.where(category_id: 1).paginate(page: params[:page])
  @categorized_articles_2 = @articles.where(category_id: 2).paginate(page: params[:page])
 end

 private

 def category_params
  params.require(:category).permit(:category_name)
 end

 def admin_user
  redirect_to(root_path) unless current_user.admin?
 end

end

