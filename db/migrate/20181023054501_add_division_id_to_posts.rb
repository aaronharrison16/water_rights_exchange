class AddDivisionIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :division_id, :integer
  end
end
