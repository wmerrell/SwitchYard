require 'test_helper'

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    ActiveRecord::Base.connection.execute('delete from users')
    cookies.delete(:auth_token)
    @attr = {
      user_name: 'Test User',
      email: 'user@test.com',
      password: 'abcdef',
      password_confirmation: 'abcdef',
      password_reset_sent_at: Time.zone.now,
      password_reset_token: 'zyxw_password_reset_token_dcba'
    }
    @user = User.create!(@attr)
  end

  test 'should get new' do
    print "\nController:PasswordResets new_password_reset"
    get new_password_reset_url
    assert_response :success
    assert_match '<h2>Forgot Your Password</h2>', @response.body
  end

  test 'post create should succeed on existing user login' do
    print "\nController:PasswordResets post create should succeed on existing user login"
    post password_resets_url, params: { email: 'user@test.com' }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match '<h2>Welcome to SwitchYard</h2>', @response.body
  end

  test 'should get edit user password' do
    print "\nController:PasswordResets should get edit user password"
    get "/password_resets/zyxw_password_reset_token_dcba/edit", params: { id: 'zyxw_password_reset_token_dcba' }
    assert_response :success
    assert_match 'Reset Password', @response.body
  end

  test 'post update should succeed on existing user' do
    print "\nController:PasswordResets post update should succeed on existing user"
    patch  "/password_resets/zyxw_password_reset_token_dcba", params: { id: 'zyxw_password_reset_token_dcba',  user: { password: 'abcdef', password_confirmation: 'abcdef' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match 'Password has been reset.', @response.body
  end

  test 'post update should fail when request is too old' do
    print "\nController:PasswordResets post update should fail when request is too old"
    @user.password_reset_sent_at = 3.hours.ago
    @user.save!
    patch  "/password_resets/zyxw_password_reset_token_dcba", params: { id: 'zyxw_password_reset_token_dcba',  user: { password: 'abcdef', password_confirmation: 'abcdef' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match '<h2>Forgot Your Password</h2>', @response.body
    assert_match 'reset has expired.', @response.body
  end

  test 'post update should fail when passwords dont match' do
    print "\nController:PasswordResets post update should fail when passwords dont match"
    patch "/password_resets/zyxw_password_reset_token_dcba",
          params: { id: 'zyxw_password_reset_token_dcba',
                    user: { password: 'abcdef', password_confirmation: 'xyzzy' } }
    assert_response :success
    assert_match 'Reset your SwitchYard password.', @response.body
    assert_match "<li>Password confirmation doesn&#39;t match Password</li>", @response.body
  end
end
