class AddBirthToGirls < ActiveRecord::Migration
  def change
    add_column :girls, :birth, :date
  end
end
