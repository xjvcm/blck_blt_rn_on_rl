class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/ideas/"
    else
      flash[:reg_errors] = [@user.errors.full_messages.each]
      redirect_to :back
    end
  end
  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
end
