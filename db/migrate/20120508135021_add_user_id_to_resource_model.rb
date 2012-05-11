class AddUserIdToResourceModel < ActiveRecord::Migration
  # rails g migration AddUserIdToResource
  # then added this stuff
  
  def up
    add_column :resources, :user_id, :integer, :default => 1 # table name, column name, data type, options
  end
  
  def down
    remove_column :resources, :user_id
  end
end