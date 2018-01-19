class AddCategoryIdtoRoutesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :category_id, :integer
  end
end
