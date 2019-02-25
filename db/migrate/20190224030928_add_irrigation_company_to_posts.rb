class AddIrrigationCompanyToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :irrigation_company, :string
  end
end
