require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    print "\nController:Sessions get sessions_new"
    get sessions_new_url
    assert_response :success
  end
end
