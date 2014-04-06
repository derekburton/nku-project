class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to coasters_path
      flash[:signedup] = 'Welcome'
    else
      flash[:error] = 'Email/password incorrect'
      render 'new'
    end
  end
  
  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:loggedout] = 'Logged out'
      redirect_to coasters_path
    end
  end
  
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
  
end