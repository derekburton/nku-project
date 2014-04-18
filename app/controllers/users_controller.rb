class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    if session[:user_id]
      redirect_to coasters_path, notice: "Already logged in as user"
    else
      @user = User.new(params[:user].permit(:name, :email, :password, :password_confirmation))
    
      if @user.save
        redirect_to coasters_path, notice: "User created"
        session[:user_id] = @user.id
      else
        render 'new'
      end   
    end
  end
  
  def edit
    if(session[:user_id] == nil)
      redirect_to signin_session_path, notice: "Not logged in"
    end
    @user = User.find(params[:id])
  end
  
  def update
    if(session[:user_id] == nil)
      redirect_to signin_session_path, notice: "Not logged in"
    end
    
    @user = User.find(params[:id])
 
    if session[:user_id] == @user.id
      if @user.update(params[:user].permit(:name, :nickname, :email, :password_digest))
        redirect_to coasters_path, notice: 'User updated'
      else
        render 'edit'
      end
    else
      redirect_to coasters_path, notice: "Not logged in as user"
    end
  end
end
