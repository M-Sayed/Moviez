class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :movie_id
      t.string  :title
      t.text  :overview
      t.string  :tagline
      t.string  :poster_path
      t.decimal :rate,  precision: 10,
                        scale: 2,
                        null: false,
                        default: 0

      t.timestamps
    end

    add_index :movies, :movie_id, unique: true
  end
end
