class CreateLandmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.text :history
      t.timestamps
    end
  end
end
