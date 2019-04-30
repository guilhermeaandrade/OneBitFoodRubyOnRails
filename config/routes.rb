Rails.application.routes.draw do
  resources :categories, only: :index
  resources :restaurants, only: %i[index show] do
    get :search, on: :collection
  end
  resources :orders, only: %i[create show]
end
