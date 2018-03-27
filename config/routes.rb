Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root to: 'home_path'

  #user routes
  get '/users/log_in', to: 'users#log_in', as: 'user_log_in'
  post '/users/log_in', to: 'users#authenticate'
  get '/users/sign_up', to: 'users#sign_up', as: 'user_sign_up'
  post '/users/sign_up', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  patch '/users/:id', to: 'users#update'

end
