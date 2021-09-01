Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    post '/users/guest_sign_in', to: 'users#guest_sign_in'
  end
  root to: "time_content#index"
  resources :users, only: [:show]
  resources :time_content do
    collection do
     get 'keyword_search', 'detail_search'
     get 'past_record'
    end
  end

end
