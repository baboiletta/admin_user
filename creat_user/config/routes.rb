Rails.application.routes.draw do
  get 'admin', to: 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  resources :sections
  resources :pages
  resources :subjects do
    member do 
      get 'delete_form'
    end
  end
  resources :posts
  root 'access#menu'
  get 'hello/index'
  get 'hello/byebye'
  # get 'subjects/delete_form'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
