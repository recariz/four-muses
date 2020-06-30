Rails.application.routes.draw do
  devise_for :users do
    resources :chatrooms, only: [:new, :create]
  end
  devise_for :artists
  devise_for :businesses
  root to: 'pages#home'

  resources :posts do
    resources :comments, only: [:new, :create]
    member do
      get :like
      get :dislike
      put "like", to: "posts#like"
      put "dislike", to: "posts#dislike"
    end
  end

  resources :comments, only: [:edit, :update, :destroy]

  resources :contests do
    resources :contest_applications, only: [:new, :create]
  end


  resources :contest_applications, only: [:show, :index] do
    resources :payments, only: :new
  end



  resources :chatrooms, only: [:index, :show, :create] do
   resources :messages, only: [:index, :create]
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      post :follow
      post :unfollow
    end
 end
 get '/dashboard', to: 'pages#dashboard', as: :dashboard

 patch '/contest_applications/:id', to: 'contest_applications#change_status', as: :contest_application_status_change

end
