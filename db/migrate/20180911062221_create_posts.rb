class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :number_availble
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
