class AddActiveToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :active, :boolean, :default => false
  end
end
