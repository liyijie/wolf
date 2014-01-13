class RemoveAgeFromGirls < ActiveRecord::Migration
  def change
    remove_column :girls, :age, :integer
  end
end
