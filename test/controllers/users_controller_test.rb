require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    ActiveRecord::Base.connection.execute('delete from users')
    @attr = {
      user_name: 'Test User',
      email: 'user@test.com',
      password: 'abcdef',
      password_confirmation: 'abcdef',
    }
  end

  test 'should get new' do
    print "\nController:Users get signup"
    get signup_url
    assert_response :success
    assert_match '<h2>Sign Up as a New User.</h2>', @response.body
  end

  test 'post create should succeed on new user' do
    print "\nController:Users post create should succeed on new user"
    post users_url, params: { user: @attr }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match '<h2>Welcome to SwitchYard</h2>', @response.body
  end

  test 'post create should fail on existing user' do
    print "\nController:Users post create should fail on existing user"
    assert User.create!(@attr)
    post users_url, params: { user: @attr }
    assert_response :success
    assert_match '<h2>Sign Up as a New User.</h2>', @response.body
  end
end
