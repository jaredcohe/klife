class AddPasswordResetToUsers < ActiveRecord::Migration
  #rails g migration add_password_reset_to_users password_reset_token:string password_reset_sent_at:datetime
  def change
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datetime
  end
end
