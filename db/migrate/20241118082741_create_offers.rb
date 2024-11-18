class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.references :boardgame, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
