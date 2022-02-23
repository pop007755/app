Rails.application.routes.draw do
  post 'members', to: 'members#create'
  post 'messages', to: 'messages#create'
  get 'messages/:group_id', to: 'messages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
