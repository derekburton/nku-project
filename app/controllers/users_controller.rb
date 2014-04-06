class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user].permit(:name, :email, :password, :password_confirmation))
    
    if @user.save
      redirect_to coasters_path
      session[:user_id] = @user.id
      flash.now[:saved] = 'User created'
    else
      render 'new'
    end
  end
  
  def edit
    if(session[:user_id] == nil)
       redirect_to signin_session_path
    end
    @user = User.find(params[:id])
  end
  
  def update
    if(session[:user_id] == nil)
       redirect_to signin_session_path
    end
    
    @user = User.find(params[:id])
 
    if session[:user_id] == @user.id
      if @user.update(params[:user].permit(:name, :nickname, :email, :password_digest))
        redirect_to coasters_path
        flash[:update] = 'User updated'
      else
        render 'edit'
      end
    else
      flash[:error] = 'Not logged in as user'
      redirect_to coasters_path
    end
  end
end
