class AddDimentionsToPrinter < ActiveRecord::Migration[5.2]
  def change
    add_column :printers, :dimention_x, :float
    add_column :printers, :dimention_y, :float
    add_column :printers, :dimention_z, :float
  end
end
