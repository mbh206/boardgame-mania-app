class AddImagesToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :photos, :string
  end
end
