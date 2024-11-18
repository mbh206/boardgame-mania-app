class CreateBoardgames < ActiveRecord::Migration[7.1]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.string :category
      t.integer :player_count
      t.text :description

      t.timestamps
    end
  end
end
