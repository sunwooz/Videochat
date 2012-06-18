class CoursesController < ApplicationController
  
  def new
    @course = Course.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @course = Course.new(params[:course])
    
    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, :notice => 'Created new Course' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def index
    @courses = Course.all
  end
  
  def show
    @course = Course.find(params[:id])
    @stories = @course.stories.all
  end
  
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    
    respond_to do |format|
      format.html { redirect_to courses_path }
    end
  end
end
