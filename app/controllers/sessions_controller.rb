class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    logger.info "[Rainforest.SessionsController.create] Trying to log in #{params[:email]}"
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # binding.pry
      redirect_to products_url, notice: "#{user.email} Logged In."
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "Logged Out."
  end
end
