class AddWaterTypeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :water_type, :integer
  end
end
