Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  root 'posts#index'

  post '/posts/:id', to: 'posts#update'

  resources :users, only: %i[new create]

  resources :posts, shallow: true do
    redources :comments, only: %i[new create edit update]
  end
end
