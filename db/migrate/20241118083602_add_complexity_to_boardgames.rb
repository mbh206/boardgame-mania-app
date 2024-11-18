class AddComplexityToBoardgames < ActiveRecord::Migration[7.1]
  def change
    add_column :boardgames, :complexity, :float
  end
end
