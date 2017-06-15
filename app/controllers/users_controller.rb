require "pry"

class UsersController < ApplicationController
  before_action :authenticated, only: [:show]

  def show
    @user = User.find(params[:id])
    # to_welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end 

  private

  def user_params
    params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :admin ,:password)
  end

end
