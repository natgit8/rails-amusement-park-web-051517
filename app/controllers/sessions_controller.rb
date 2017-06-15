class SessionsController < ApplicationController

  def welcome
  end

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return redirect_to signin_path unless @user.authenticate(params[:user][:password])
    current_user = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete(:user_id)
    redirect_to welcome_path
  end

end
