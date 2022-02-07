Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :logins, only: [:new, :create, :destroy]
  get 'registrations/new'
  get 'registrations/destroy'
  get 'logins/new'
  get 'logins/destroy'
  post '/register' => 'registrations#create'
  post '/logins' => 'logins#create'
  get 'logout', to: 'logins#destroy', as: 'logout'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
