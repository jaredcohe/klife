class RemoveAndAddPasswordFieldsToUserModel < ActiveRecord::Migration
  def up
    add_column :users, :password_digest, :string
    remove_column :users, :password_hash
    remove_column :users, :password_salt
  end

  def down
    remove_column :users, :password_digest
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
  end
end
