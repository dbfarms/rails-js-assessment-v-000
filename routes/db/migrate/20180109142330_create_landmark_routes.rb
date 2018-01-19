class CreateLandmarkRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :landmark_routes do |t|
      t.integer :landmark_id 
      t.integer :route_id 
      t.timestamps
    end
  end
end
