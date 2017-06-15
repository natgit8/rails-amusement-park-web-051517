class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return render :new unless @user.save
    current_user = @user.id
    redirect_to user_path(@user)
  end

  private

  def id_params
    params.require(:user).permit(:id)
  end

  def user_params
    params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :admin ,:password, :password_confirmation)
  end

end
