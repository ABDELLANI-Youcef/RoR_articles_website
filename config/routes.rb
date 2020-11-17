Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "categories#index"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:show, :create]
  resources :articles do
    resources :image_elements
    resources :votes, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show, :create]
end
