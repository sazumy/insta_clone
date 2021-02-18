Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  root 'posts#index'

  post '/posts/:id', to: 'posts#update'

  resources :users, only: %i[index show new create]

  resources :posts, shallow: true do
    resources :comments, only: %i[new create edit update destroy]
    collection do
      get :search
    end
  end

  namespace :mypage do
    resource :account, only: %i[edit update]
  end

  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
