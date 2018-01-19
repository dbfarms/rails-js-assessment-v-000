class AddRatingToRoutesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :rating, :integer
  end
end
