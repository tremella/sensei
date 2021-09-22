Rails.application.routes.draw do
  get 'home/index'


  resources :slots do
    collection do
      post :timeslices
    end
  end
  
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
