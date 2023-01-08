Rails.application.routes.draw do
  get 'users/create'
  get 'users/update'
  get 'users/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :users, only: [:create, :update, :delete]
end
