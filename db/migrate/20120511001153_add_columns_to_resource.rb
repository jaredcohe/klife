class AddColumnsToResource < ActiveRecord::Migration
  # rails g migration AddColumnsToResource
  # add_column table_name, column_name, data_type, options
  # remove_column table_name, column_name

  def up
    add_column :resources, :keywords, :text
    add_column :resources, :keywords_scraped, :text
    add_column :resources, :title_scraped, :text
    add_column :resources, :description_scraped, :text
  end

  def down
    remove_column :resources, :keywords
    remove_column :resources, :keywords_scraped
    remove_column :resources, :title_scraped
    remove_column :resources, :description_scraped
  end
  
end
