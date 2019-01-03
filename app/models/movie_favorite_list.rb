class MovieFavoriteList < ApplicationRecord
  belongs_to :movie
  belongs_to :favorite_list

  validates_presence_of :movie, :favorite_list
  validates :movie, uniqueness: { scope: :favorite_list_id }
end
