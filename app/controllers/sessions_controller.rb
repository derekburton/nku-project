class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    if session[:user_id]
      redirect_to coasters_path, notice: "Already logged in"
    else
      @user = User.find_by(email: session_params[:email])
      if @user && @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
        redirect_to coasters_path, notice: 'Welcome'
      else
        flash[:error] = 'Email/password incorrect'
        render 'new'
      end
    end
  end
  
  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to coasters_path, notice: 'Logged out'
    end
  end
  
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
  
end