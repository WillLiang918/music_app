class SessionController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.is_password?(params[:user][:password])
      login!(@user)
      redirect_to user_url(current_user)
    else

      flash.now[:errors] = ["Incorrect email / password combination"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
