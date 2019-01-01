class MovieFavoriteListsController < ApplicationController
  before_action :set_movie_favorite_list, only: :destroy

  def new
    @movie_favorite_list = MovieFavoriteList.new
  end

  def create
    @movie_favorite_list = MovieFavoriteList.new(movie_favorite_list_params)
  end

  def destroy
    @movie_favorite_list.destroy
  end

  private

  def movie_favorite_list_params
    params.require(:movie_favorite_list)
          .permit(:movie_id, :favorite_list_id)
  end

  def set_movie_favorite_list
    @movie_favorite_list = MovieFavoriteList.find_by!(
      movie_id: params[:movie_id],
      favorite_list_id: params[:favorite_list_id]
    )
  end
end
