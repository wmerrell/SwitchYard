require 'test_helper'

# SyLayoutsControllerTest
class SyLayoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    ActiveRecord::Base.connection.execute('delete from users')
    cookies.delete(:auth_token)
    @user = User.create!(
      user_name: 'Test User',
      email: 'user@test.com',
      password: 'abcdef',
      password_confirmation: 'abcdef',
      auth_token: 'test_auth_token'
    )
    cookies[:auth_token] = @user.auth_token # User must be logged in
    ActiveRecord::Base.connection.execute('delete from sy_layouts')
    @sy_layout = SyLayout.create!(
      name: 'Test Layout',
      owner: @user.user_name,
      description: 'A Test Layout',
      created_by: @user,
      updated_by: @user
    )
  end

  test 'should get index' do
    print "\nController:SyLayouts should get index"
    get sy_layouts_url
    assert_response :success
  end

  test 'should get new' do
    print "\nController:SyLayouts should get new"
    get new_sy_layout_url
    assert_response :success
  end

  test 'should create layout' do
    print "\nController:SyLayouts should create layout"
    assert_difference('SyLayout.count') do
      post sy_layouts_url,
           params: { sy_layout: { name: @sy_layout.name, owner: @sy_layout.owner } }
    end

    assert_redirected_to sy_layout_url(SyLayout.last)
  end

  test 'should show layout' do
    print "\nController:SyLayouts should show layout"
    get sy_layout_url(@sy_layout)
    assert_response :success
  end

  test 'should get edit' do
    print "\nController:SyLayouts should get edit"
    get edit_sy_layout_url(@sy_layout)
    assert_response :success
  end

  test 'should update layout' do
    print "\nController:SyLayouts should update layout"
    patch sy_layout_url(@sy_layout),
          params: { sy_layout: { name: @sy_layout.name, owner: @sy_layout.owner } }
    assert_redirected_to sy_layout_url(@sy_layout)
  end

  test 'should destroy layout' do
    print "\nController:SyLayouts should destroy layout"
    assert_difference('SyLayout.count', -1) do
      delete sy_layout_url(@sy_layout)
    end

    assert_redirected_to sy_layouts_url
  end

  test 'should reject index if not logged in' do
    print "\nController:SyLayouts reject index if not logged in"
    cookies.delete(:auth_token)
    @user.destroy
    @user = nil
    get sy_layouts_url
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
