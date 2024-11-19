class AddImagesToBoardgames < ActiveRecord::Migration[7.1]
  def change
    add_column :boardgames, :poster, :string
  end
end
