class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :qq
      t.string :city
      t.integer :age
      t.integer :height
      t.integer :weight
      t.integer :grade_id
      t.integer :age_min
      t.integer :age_max
      t.integer :height_min
      t.integer :height_max
      t.integer :weight_min
      t.integer :weight_max
      t.string :comment

      t.timestamps
    end
  end
end
