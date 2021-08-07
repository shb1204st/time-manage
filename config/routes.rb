Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
  root to: "time_content#index"
  resources :users, only: [:show]
  resources :time_content
  
end
