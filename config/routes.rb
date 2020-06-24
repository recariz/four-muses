Rails.application.routes.draw do
  devise_for :users do
    resources :chatrooms, only: [:new, :create]
  end
  devise_for :artists
  devise_for :businesses
  root to: 'pages#home'

  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end

  resources :comments, only: [:edit, :update, :destroy]
  resources :likes, only: [:destroy]

  resources :contests do
    resources :contest_applications, only: [:new, :create]
  end

  resources :contest_applications, only: [:index, :edit, :update, :destroy]

  resources :chatrooms, only: [:index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
