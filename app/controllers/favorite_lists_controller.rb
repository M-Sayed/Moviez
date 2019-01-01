class FavoriteListsController < ApplicationController
  before_action :set_favorite_list, only: :clear
  before_action :eager_load_favorite_list, only: :show

  def show; end

  def clear
    favorite_list_clearer = FavoriteListClearer.call(@favorite_list)

    if favorite_list_clearer.success?
    else
    end
  end

  private

  def eager_load_favorite_list
    # @favorite_list = current_user.favorite_list.includes(:movies)
    @favorite_list = FavoriteList.includes(:movies).find(params[:id])
  end

  def set_favorite_list
    @favorite_list = FavoriteList.find(params[:id])
  end
end
