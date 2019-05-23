# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  user_name              :string
#  auth_token             :string
#  email                  :string
#  password_digest        :string
#  password_reset_token   :string
#  password_reset_sent_at :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  validates_presence_of :user_name, :email, :password, :password_confirmation, on: :create

  validates_uniqueness_of :email
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless User.exists?(column => self[column])
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
end
