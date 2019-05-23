# CreateUsers
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :auth_token, unique: true
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false

      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps
    end
  end
end
