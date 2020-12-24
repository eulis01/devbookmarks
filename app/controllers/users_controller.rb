class UsersController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  before_action :verified_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:id] = @user.id
    redirect_to controller: 'bookmarks', action: 'home'
  end

  # PATCH/PUT /users/1
  def update

  end

  # DELETE /users/1
  def destroy
    @user = current_user
    if @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    else 
      render 'form'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :description, :password, :password_confirmation)
    end
end
