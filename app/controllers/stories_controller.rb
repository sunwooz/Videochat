class StoriesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @story = Story.new
    
    respond_to do |format|
      format.html
    end 
  end
  
  def create
    @course = Course.find(params[:course_id])
    @story = @course.stories.build(params[:story])
    respond_to do |format|
      if @story.save
        format.html { redirect_to @course }
        format.xml { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { redirect_to(@course) }
        format.xml { render :xml => @story.errors }
      end
    end
  end
  
  def show
    @course = Course.find(params[:id])
    @story = @course.stories.find(params[:course_id])
  end
  
  def index
    @course = Course.find(params[:course_id])
    @stories = @course.stories.all
  end
  
  def edit
    @course = Course.find(params[:id])
    @story = @course.stories.find(params[:course_id])
  end
  
  def update
    @story = Story.find(params[:id])
    @course = @story.course
    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @course , notice: 'Story was successfully created. You rock Daniel!' }
      else
        format.html { redirect_to @course, notice: 'You suck, something failed' }
      end
    end
  end
  
  def destroy
    @course = Course.find(params[:id])
    @story = @course.stories.find(params[:course_id])
    respond_to do |format|
      if @story.destroy
        format.html { redirect_to @course }
      end
    end
  end
  
  def storychat
    
  end
end
