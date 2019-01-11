class AddSaleStatusToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sale_status, :integer, default: 0
  end
end
