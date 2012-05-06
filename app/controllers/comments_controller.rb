class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html
      format.xml { render json: @comment }
    end
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@post) }
        format.xml { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { redirect_to(@post) }
        format.xml { render :xml => @comment.errors }
      end
    end
  end
  
  
end
