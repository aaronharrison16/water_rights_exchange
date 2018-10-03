class ChangeAvailableTypeInPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :available, :decimal
  end
end
