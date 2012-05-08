class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :raw_url
      t.string :clean_url
      t.text :description

      t.timestamps
    end
  end
end
