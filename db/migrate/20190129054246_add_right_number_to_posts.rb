class AddRightNumberToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :right_number, :integer
  end
end
