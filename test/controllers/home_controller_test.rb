require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    print "\nController:Home get index"
    get index_url
    assert_response :success
    assert_match '<h2>Welcome to SwitchYard</h2>', @response.body
  end

  test 'should get about' do
    print "\nController:Home get about"
    get about_url
    assert_response :success
    assert_match '<h2>A tool for generating Operations Paperwork', @response.body
  end
end
