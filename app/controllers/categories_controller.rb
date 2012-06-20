class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path }
      else
        format.html { redirect_to categories_path, :notice => 'There was an error' }
      end
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path }
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_path }
      end
    end
  end
end
