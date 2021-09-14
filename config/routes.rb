Rails.application.routes.draw do
  get 'home/index'

  # get 'slots/new'
  # get 'slots/book'
  # get 'slots/destroy'

  # post 'slots/new'

  resources :slots
  
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
