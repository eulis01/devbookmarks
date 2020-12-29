class UsersController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
  before_action :set_user, only: [:edit]

  def index
    @users = User.all
  end

  # GET /users/1
  def show
    set_user
    @user = User.find_by(id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end
  
  # POST /users
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        lash[:message] = "Your account was created"
        redirect_to root_path(@user)
      else
        render :new
      end
  end
  
  # GET /users/1/edit
  def edit
    set_user
    #@user = User.find_by_id(params[:id])
    if @user && logged_in?
        render :edit
    else
        flash[:error] = "You don't have permission"
    end  
  end

  # PATCH/PUT /users/1
  def update
    set_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    set_user
    @user.delete
    flash[:error] = "You have successfully deleted your account!"
    redirect_to signup_path 
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :description, :password, :password_confirmation)
    end

    def set_user
      @user = User.find_by_id(params[:id])
    end
end
