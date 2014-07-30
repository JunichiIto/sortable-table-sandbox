class AddRowOrderToFruits < ActiveRecord::Migration
  def change
    add_column :fruits, :row_order, :integer
  end
end
