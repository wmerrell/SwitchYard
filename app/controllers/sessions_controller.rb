# SessionsController
class SessionsController < ApplicationController
  def new
    @title = @heading = 'Sign In'
    @intro = 'Sign In to SwitchYard'
    @content = "Please Sign In to SwitchYard."
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      if params[:remember_me] == '1'
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, notice: 'Signed In!'
    else
      flash.now.alert = 'Email or password is invalid'
      @title = @heading = 'Sign In'
      @intro = 'Sign In to SwitchYard'
      @content = "Please Sign In to SwitchYard."
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: 'Signed Out!'
  end
end
