Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
    
  # pagesコントローラーのhomeアクションのルーティング
  root 'posts#index'
  
  # ユーザページルーティングパスをuserに変換
  get '/users/:id', to: 'users#show', as: 'user'
  
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
  
end
