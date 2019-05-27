require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'visiting the index' do
    print "\nSystem:Users visiting_index"
    visit users_url
    assert_selector 'h1', text: 'Users'
  end
end
