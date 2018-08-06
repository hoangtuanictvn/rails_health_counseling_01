class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      activate_check user
    else
      flash.now[:message] = t "sessions.new.error"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def remember_check user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end

  def activate_check user
    if user.activated?
      log_in user
      remember_check user
      redirect_to user
    else
      flash[:warning] = t "sessions.create.need_activate"
      redirect_to root_url
    end
  end
end
