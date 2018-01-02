Rails.application.routes.draw do
resources :attractions
resources :users

root 'users#index'

get '/signin' => 'sessions#new'
post '/signin'=> 'sessions#create'
post 'logout' => 'sessions#destroy'
delete '/logout' => 'sessions#destroy'

get '/attractions', to: 'attractions#show'
post '/attractions/new', to: 'attractions#show'
end
