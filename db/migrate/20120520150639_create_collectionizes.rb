class CreateCollectionizes < ActiveRecord::Migration
  def change
    create_table :collectionizes do |t|
      t.integer :collection_id, :null => false
      t.integer :resource_id, :null => false
      t.integer :order, :null => false
      t.text :notes

      t.timestamps
    end
  end
end
