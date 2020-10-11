Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'events/index' => 'events#index'
  
  get 'events/link' => 'events#link'

  get 'fashions/new' => 'fashions#new'
  
  post 'fashions' => 'fashions#create'
  
  get 'fashions/:id' => 'fashions#show',as: 'fashion'

  patch 'fashions/:id' => 'fashions#update'
  delete 'fashions/:id' => 'fashions#destroy'
  get 'fashions/:id/edit' => 'fashions#edit', as:'edit_fashion'

  get 'tags/:tag', to: 'fashions#index', as: :tag

  root 'fashions#index'

  get  'favorites/index'
  post '/favorites', to: 'favorites#create'

  resources :fashions do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

end
