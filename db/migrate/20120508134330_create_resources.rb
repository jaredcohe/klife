class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title, :null => false
      t.string :raw_url, :null => false
      t.string :clean_url, :null => false
      t.text :description

      t.timestamps
    end
  end
end
