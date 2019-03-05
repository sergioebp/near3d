class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :description
      t.boolean :public, :default => false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
