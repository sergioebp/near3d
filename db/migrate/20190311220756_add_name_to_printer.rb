class AddNameToPrinter < ActiveRecord::Migration[5.2]
  def change
    add_column :printers, :name, :string
  end
end
