class AddThumbnailToBoardgames < ActiveRecord::Migration[7.1]
  def change
    add_column :boardgames, :thumbnail, :string
  end
end
