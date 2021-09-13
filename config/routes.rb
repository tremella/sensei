Rails.application.routes.draw do
  get 'slots/create'
  get 'slots/book'
  get 'slots/destroy'
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
