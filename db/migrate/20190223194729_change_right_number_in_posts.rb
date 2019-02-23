class ChangeRightNumberInPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :right_number, :string
  end
end
