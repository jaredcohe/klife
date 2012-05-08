class AddUserIdToResourceModel < ActiveRecord::Migration
  def up
    add_column :resources, :user_id, :integer, :default => 1
  end
  
  def down
    remove_column :user_id, :string
  end
end