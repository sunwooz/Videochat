class LanguagesController < ApplicationController
  
  def new
    @language = Language.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @language = Language.new(params[:language])
    
    respond_to do |format|
      if @language.save
        format.html { redirect_to languages_path, :notice => 'Created new language' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def index
    @languages = Language.all
  end
  
  def show
    @language = Language.find(params[:id])
  end
  
  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    
    respond_to do |format|
      format.html { redirect_to languages_path }
    end
  end
end
