# PasswordResetsController
class PasswordResetsController < ApplicationController
  def new
    @title = @heading = 'Forgot Password'
    @intro = 'Forgot Your Password'
    @content = "Please enter the email you used when you signed up."
  end

  def create
    user = User.find_by_email(params[:email])
    user&.send_password_reset
    redirect_to root_url, notice: 'Email sent with password reset instructions.'
  end

  def edit
    @title = @heading = 'SwitchYard - Reset Password'
    @intro = 'Reset your SwitchYard password.'
    @content = "The password and the confirmation password must match."
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: 'Password &crarr;
        reset has expired.'
    elsif @user.update_attributes(user_params)
      redirect_to root_url, notice: 'Password has been reset.'
    else
      @title = @heading = 'SwitchYard - Reset Password'
      @intro = 'Reset your SwitchYard password.'
      @content = "The password and the confirmation password must match."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
