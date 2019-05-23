# UsersController
class UsersController < ApplicationController
  def new
    @title = @heading = 'Sign Up'
    @intro = 'Sign Up as a New User.'
    @content = "You can\'t do anything in SwitchYard without signing in,
                so create yourself as a user. Please use use the name you
                would like to be known as and a real email address."
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :auth_token, :email, :password, :password_confirmation)
  end
end
