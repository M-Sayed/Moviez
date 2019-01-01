class CreateMovieFavoriteLists < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_favorite_lists do |t|
      t.references :movie, foreign_key: true
      t.references :favorite_list, foreign_key: true

      t.timestamps
    end
  end
end
