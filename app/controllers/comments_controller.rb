class CommentsController < ApplicationController
  before_filter :admin_auth, :only => [ :edit, :update ]
  
  def admin_auth
    if current_user
      if current_user.email == "yangsunwoo@gmail.com"
        current_user
      else
        redirect_to posts_path, :notice => "You must be an admin"
      end
    else
      redirect_to posts_path, :notice => "You must be logged in"
    end
  end
  
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
  
  def edit
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:post_id])  
  end
  
  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comment.find(params[])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
end
