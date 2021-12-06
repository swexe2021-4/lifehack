Rails.application.routes.draw do
 root 'lifehacks#index'
 resources :lifehacks
 resources :likes
 resources :mylists
 resources :profiles
 resources :comments
  get 'followers/index'
  get 'follows/index'
 resources :users do
  get 'likes/index'
   resources :relationships, only: [:create,:destroy]
    get 'followers', on: :member
    get 'follows', on: :member
 end
 post 'tops/login'
 get 'tops/logout'
 get 'tops/main'
 get 'get_image/:id', to: 'lifehacks#get_image'
 
end
