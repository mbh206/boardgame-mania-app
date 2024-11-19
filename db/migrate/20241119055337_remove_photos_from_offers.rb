class RemovePhotosFromOffers < ActiveRecord::Migration[7.1]
  def change
    remove_column :offers, :photos, :string
  end
end
