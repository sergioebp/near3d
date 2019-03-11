class CreatePrinters < ActiveRecord::Migration[5.2]
  def change
    create_table :printers do |t|
      t.references :store, foreign_key: true
      t.integer :base_price
      t.integer :hour_price
      t.string :description

      t.timestamps
    end
  end
end
