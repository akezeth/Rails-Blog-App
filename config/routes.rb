Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'comments/index'
      get 'comments/create'
      get 'posts/index'
    end
  end
  devise_for :users
  resources :users, only: [:index, :show] do

    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  root "users#index"
end
