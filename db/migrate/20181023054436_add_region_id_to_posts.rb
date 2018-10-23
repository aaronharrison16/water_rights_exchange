class AddRegionIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :region_id, :integer
  end
end
