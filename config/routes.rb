Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  get '/search_movies' => 'movies#search', as: :search_movies
  resources :movies, only: :show

  root to: 'home#index'
end
