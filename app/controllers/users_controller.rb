class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id  # this is ok
      # self.current_user=(@user)     # this is better
      set_current_user(@user)         # this one feels better to use
      redirect_to products_url, notice: 'Signed Up!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
