class AddRouteIdToLandmarksTable < ActiveRecord::Migration[5.1]
  def change
    add_column :landmarks, :route_id, :integer
  end
end
