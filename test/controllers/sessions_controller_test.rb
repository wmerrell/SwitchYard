require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    ActiveRecord::Base.connection.execute('delete from users')
    cookies.delete(:auth_token)
    @attr = {
      user_name: 'Test User',
      email: 'user@test.com',
      password: 'abcdef',
      password_confirmation: 'abcdef'
    }
  end

  test 'should get new' do
    print "\nController:Sessions get sessions_new"
    get new_session_url
    assert_response :success
    assert_match '<h1>Sign In</h1>', @response.body
  end

  test 'post create should succeed on existing user login' do
    print "\nController:Sessions post create should succeed on existing user login"
    assert @user = User.create!(@attr)
    post sessions_url, params: { email: 'user@test.com', password: 'abcdef', remember_me: '1' }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match '<h2>Welcome to SwitchYard</h2>', @response.body
  end

  test 'post create should fail if user does not exist' do
    print "\nController:Sessions post create should fail if user does not exist"
    assert @user = User.create!(@attr)
    post sessions_url, params: { email: 'xxxx@test.com', password: 'abcdef', remember_me: '1' }
    assert_response :success
    assert_match 'Email or password is invalid', @response.body
  end

  test 'post create should fail if password is wrong' do
    print "\nController:Sessions post create should fail if password is wrong"
    assert @user = User.create!(@attr)
    post sessions_url, params: { email: 'user@test.com', password: 'xxx', remember_me: '1' }
    assert_response :success
    assert_match 'Email or password is invalid', @response.body
  end

  test 'post create should leave a temporary cookie' do
    print "\nController:Sessions post create should leave a temporary cookie"
    assert @user = User.create!(@attr)
    post sessions_url, params: { email: 'user@test.com', password: 'abcdef', remember_me: '0' }
    assert_equal cookies[:auth_token], @user.auth_token
  end

  test 'post create should leave a permanent cookie' do
    print "\nController:Sessions post create should leave a permanent cookie"
    assert @user = User.create!(@attr)
    post sessions_url, params: { email: 'user@test.com', password: 'abcdef', remember_me: '1' }
    assert_equal cookies[:auth_token], @user.auth_token
  end

  test 'delete should destroy the cookie' do
    print "\nController:Sessions delete should destroy the cookie"
    assert @user = User.create!(@attr)
    post sessions_url, params: { email: 'user@test.com', password: 'abcdef', remember_me: '0' }
    assert_equal cookies[:auth_token], @user.auth_token
    get logout_url
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match 'Signed Out!', @response.body
  end
end
