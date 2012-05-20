class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id, :null => false
      t.string :title, :null => false
      t.text :description
      t.text :keywords

      t.timestamps
    end
  end
end
