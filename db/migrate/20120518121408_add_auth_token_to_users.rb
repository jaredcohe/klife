class AddAuthTokenToUsers < ActiveRecord::Migration
  # rails g migration add_auth_token_to_users auth_token:string
  def change
    add_column :users, :auth_token, :string
  end
end
