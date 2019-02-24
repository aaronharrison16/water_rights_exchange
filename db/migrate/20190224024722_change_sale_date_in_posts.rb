class ChangeSaleDateInPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :sale_date, :datetime
  end
end
