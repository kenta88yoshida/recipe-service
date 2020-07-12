class AddMakingTimeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :making_time, :string
  end
end
