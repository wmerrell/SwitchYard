# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  user_name              :string           not null
#  auth_token             :string
#  email                  :string           not null
#  password_digest        :string           not null
#  password_reset_token   :string
#  password_reset_sent_at :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'test_helper'

class UserTest < Minitest::Test
  def setup
    ActiveRecord::Base.connection.execute('delete from users')
    @attr = {
      user_name: 'Test User',
      email: 'user@test.com',
      password: 'abcdef',
      password_confirmation: 'abcdef'
    }
  end

  def test_that_new_user_is_valid
    print "\nModel:User test_that_new_user_is_valid"
    user = User.new(@attr)
    assert user.save, 'new user save should work'
    assert user.valid? 'saved user should be valid'
    refute user.auth_token.blank?, 'the auth_token was not created'
  end

  def test_that_creation_is_invalid_without_name
    print "\nModel:User test_that_creation_is_invalid_without_name"
    user = User.new(@attr.reject { |k, _v| k == :user_name })
    refute user.valid?, 'user is not valid without a name'
    refute user.save, 'user cannot be saved without a name'
  end

  def test_that_creation_is_invalid_without_email
    print "\nModel:User test_that_creation_is_invalid_without_email"
    user = User.new(@attr.reject { |k, _v| k == :email })
    refute user.valid?, 'user is not valid without an email'
    refute user.save, 'user cannot be saved without an email'
  end

  def test_that_creation_is_invalid_without_password
    print "\nModel:User test_that_creation_is_invalid_without_password"
    user = User.new(@attr.reject { |k, _v| k == :password })
    refute user.valid?, 'user is not valid without a password'
    refute user.save, 'user cannot be saved without a password'
  end

  def test_that_creation_is_invalid_without_password_confirmation
    print "\nModel:User test_that_creation_is_invalid_without_password_confirmation"
    user = User.new(@attr.reject { |k, _v| k == :password_confirmation })
    refute user.valid?, 'user is not valid without a password_confirmation'
    refute user.save, 'user cannot be saved without a password_confirmation'
  end

  def test_that_duplicate_email_is_rejected
    print "\nModel:User test_that_duplicate_email_is_rejected"
    user1 = User.create!(@attr)
    assert user1.valid? 'saved user1 should be valid'
    user2 = User.new(@attr.merge(user_name: 'Test User 2'))
    refute user2.valid?, 'user2 is not valid with duplicate email'
    refute user2.save, 'user2 cannot be saved with duplicate email'
  end

  def test_send_password_reset
    print "\nModel:User test_send_password_reset"
    user = User.create!(@attr)
    assert user.valid? 'saved user1 should be valid'
    assert user&.send_password_reset
  end
end
