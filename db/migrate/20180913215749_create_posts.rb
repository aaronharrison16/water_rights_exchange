class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.float :available
      t.integer :price
      t.string :address
      t.string :location

      t.timestamps
    end
  end
end
