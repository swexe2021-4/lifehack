Rails.application.routes.draw do 
  root 'lifehacks#index'
  get 'followers/index'
  get 'follows/index'
 resources :users do
   resources :relationships, only: [:create,:destroy]
    get 'followers', on: :member
    get 'follows', on: :member
 end
 post 'tops/login'
 get 'tops/logout'
 get 'tops/main'
end
