Rails.application.routes.draw do
 root 'lifehacks#index'
 resources :lifehacks do
  resources :mylist_rels, only: [:create,:destroy]
 end
 
 resources :likes
 resources :mylists
 resources :profiles
 resources :comments
  get 'followers/index'
  get 'follows/index'
  
 resources :users do
   resources :relationships, only: [:create,:destroy]
   get 'mylist_names/index'
    get 'followers', on: :member
    get 'follows', on: :member
 end

 resources :mylist_rels, only: [:create]
 resources :mylist_names do
  resources :mylist_rels, only: [:destroy]
  get 'mylist_rels/index'
 end
 
 post 'tops/login'
 get 'tops/logout'
 get 'tops/main'
 get 'get_image/:id', to: 'lifehacks#get_image'
end
