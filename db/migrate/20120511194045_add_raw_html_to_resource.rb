class AddRawHtmlToResource < ActiveRecord::Migration
  # rails g migration AddRawHtmlToResource
  # add_column table_name, column_name, data_type, options
  # remove_column table_name, column_name
  
  def up
    add_column :resources, :raw_html, :text
  end

  def down
    remove_column :resources, :raw_html
  end

end
