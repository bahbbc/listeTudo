class CreateFavoriteLists < ActiveRecord::Migration
  def change
    create_table :favorite_lists do |t|
      t.references :user
      t.references :list
      t.index [:user_id, :list_id], unique: true
      t.timestamps
    end
  end
end
