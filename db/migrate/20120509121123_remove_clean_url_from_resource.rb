class RemoveCleanUrlFromResource < ActiveRecord::Migration
  # rails g migration RemoveCleanUrlFromResource and then added this text
  # add_column table_name, column_name, data_type, options
  # remove_column table_name, column_name


  def change
    remove_column :resources, :clean_url
  end
end
