class UsersController < ApplicationController

  def log_in
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    end
  end

  def authenticate
    if @user = User.find_by(email: params[:user][:email])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:message] = "Invalid password for #{params[:user][:email]}"
        render user_log_in_path
      end
    else
      flash[:message] = "Could not find a user with email #{params[:user][:email]}"
      render user_log_in_path
    end
  end

  def sign_up
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    end
  end

  def create
    if @user = User.create(user_params)
      redirect_to user_path(@user)
    else
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:message] = "Account updated successfully"
      redirect_to user_path(@user)
    else
      flash[:message] = "Account failed to update"
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role, :password)
  end

end
