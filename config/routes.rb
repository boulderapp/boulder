Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "index#root"
  resources :users
  resources :c, controller: 'campaigns', as: :campaigns do
    resources :villages
  end

  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', as: :logout
end
