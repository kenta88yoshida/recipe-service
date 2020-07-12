class AddCostToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :cost, :string
  end
end
