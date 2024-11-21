class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
