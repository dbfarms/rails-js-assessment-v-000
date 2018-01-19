class AddCategoryIdToLandmarks < ActiveRecord::Migration[5.1]
  def change
    add_column :landmarks, :category_id, :integer 
  end
end
