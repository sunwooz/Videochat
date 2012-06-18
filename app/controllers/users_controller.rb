class UsersController < ApplicationController
  before_filter :admin_auth, :only => [ :destroy ]
  
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
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    respond_to do |format|
      @user = User.new
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.update_attributes(params[:user])
        format.html { redirect_to user_path(current_user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end
end
