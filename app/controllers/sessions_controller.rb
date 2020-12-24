class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:new, :create]

  def new	
    @user = User.new	
  end	

  def create	
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    session[:id] = @user.id
    render 'bookmarks/home'
  end	

  def destroy	
    session.delete :id
    redirect_to root_path	
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
