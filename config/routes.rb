Rails.application.routes.draw do
 root 'lifehacks#index'
 resources :users
 resources :lifehacks
 resources :likes
 resources :mylists
 resources :profiles
 resources :comments
 post 'tops/login'
 get 'tops/logout'
 get 'tops/main'
 get 'get_image/:id', to: 'lifehacks#get_image'
end
