class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.type = :Doctor if @user.request_doctor = request_doctor_check
    if @user.save
      @user.send_mail :account_activation
      @messages = [t("users.create.thank"), t("users.create.email_sent")]
      render "shared/confirm"
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:message] = I18n.t "error.user_not_found"
    render "shared/404"
  end

  private

  def request_doctor_check
    params[:user][:request_doctor] == "1"
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
