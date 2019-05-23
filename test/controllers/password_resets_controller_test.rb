require 'test_helper'

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    print "\nController:PasswordResets new_password_reset"
    get new_password_reset_url
    assert_response :success
    assert_match '<h2>Forgot Your Password</h2>', @response.body
  end
end
