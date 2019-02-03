class AddSaleDateToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sale_date, :date
  end
end
