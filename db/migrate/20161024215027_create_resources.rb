class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :quantity
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
