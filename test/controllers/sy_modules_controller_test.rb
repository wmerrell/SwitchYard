require 'test_helper'

# SyModulesControllerTest
class SyModulesControllerTest < ActionDispatch::IntegrationTest
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
    ActiveRecord::Base.connection.execute('delete from sy_modules')
    @sy_module = SyModule.create!(
      name: 'Test Layout',
      owner: @user.user_name,
      module_type: 'test_type',
      length: 20,
      width: 10,
      description: 'A Test Module',
      created_by: @user,
      updated_by: @user
    )
  end

  test 'should get index' do
    print "\nController:SyModules should get index"
    get sy_modules_url
    assert_response :success
  end

  test 'should get new' do
    print "\nController:SyModules should get new"
    get new_sy_module_url
    assert_response :success
  end

  test 'should create module' do
    print "\nController:SyModules should create module"
    assert_difference('SyModule.count') do
      post sy_modules_url,
           params: { sy_module: { name: @sy_module.name, owner: @sy_module.owner } }
    end

    assert_redirected_to sy_module_url(SyModule.last)
  end

  test 'should show module' do
    print "\nController:SyModules should show module"
    get sy_module_url(@sy_module)
    assert_response :success
  end

  test 'should get edit' do
    print "\nController:SyModules should get edit"
    get edit_sy_module_url(@sy_module)
    assert_response :success
  end

  test 'should update module' do
    print "\nController:SyModules should update module"
    patch sy_module_url(@sy_module),
          params: { sy_module: { name: @sy_module.name, owner: @sy_module.owner } }
    assert_redirected_to sy_module_url(@sy_module)
  end

  test 'should destroy module' do
    print "\nController:SyModules should destroy module"
    assert_difference('SyModule.count', -1) do
      delete sy_module_url(@sy_module)
    end

    assert_redirected_to sy_modules_url
  end

  test 'should reject index if not logged in' do
    print "\nController:SyModules reject index if not logged in"
    cookies.delete(:auth_token)
    @user.destroy
    @user = nil
    get sy_modules_url
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
