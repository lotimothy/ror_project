class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :resource, index: true, foreign_key: true
      t.references :parent, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
