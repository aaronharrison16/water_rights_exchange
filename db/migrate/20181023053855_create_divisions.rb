class CreateDivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :divisions do |t|
      t.string :name
      t.integer :region_id

      t.timestamps
    end
  end
end
