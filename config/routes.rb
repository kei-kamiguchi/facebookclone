Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks do
    collection do
      post 'confirm'
    end
  end
  root to: 'sessions#new'
end
