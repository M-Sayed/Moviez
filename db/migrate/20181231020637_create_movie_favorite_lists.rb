class CreateMovieFavoriteLists < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_favorite_lists do |t|
      t.references :movie, foreign_key: true
      t.references :favorite_list, foreign_key: true

      t.timestamps
    end

    ActiveRecord::Base.connection.execute <<-SQL
      ALTER TABLE movie_favorite_lists
        ADD CONSTRAINT movie_id_favorite_list_id_uniqesness
          UNIQUE(movie_id,favorite_list_id);
    SQL
  end
end
