Rails.application.routes.draw do
  # users
  get 'users/new' => 'users#index'
  post 'users/create' => 'users#create'
  get 'logout' => 'users#logout'
  # messages
  get 'messages' => 'messages#index'
  post 'messages/create' => 'messages#create'
  # comment
  post 'comments/create/:message_id' => 'comments#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
