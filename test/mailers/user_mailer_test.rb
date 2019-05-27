require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    ActiveRecord::Base.connection.execute('delete from users')
    @attr = {
      user_name: 'Test User',
      email: 'to@example.org',
      password: 'abcdef',
      password_confirmation: 'abcdef',
      password_reset_token: 'zyxw_password_reset_token_dcba'
    }
  end

  test 'password_reset' do
    print "\nUserMailer:password_reset"
    @user = User.create!(@attr)
    @mail = UserMailer.password_reset(@user)
    assert_equal ['to@example.org'], @mail.to
    assert_equal ['from@example.com'], @mail.from
    assert_equal 'Password Reset', @mail.subject
    assert_match 'To reset your password click the URL below.', @mail.body.encoded
    assert_match 'password_resets/zyxw_password_reset_token_dcba/edit', @mail.body.encoded
  end
end
