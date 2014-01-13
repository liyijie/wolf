class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :birth, :date
  end
end
