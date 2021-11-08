Rails.application.routes.draw do
 root 'lifehacks#index'
 resources :users
 post 'tops/login'
 get 'tops/logout'
 get 'tops/main'
end
