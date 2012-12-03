ParadaCarioca::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  
  get '/activities/search', :to => 'activities#search'

  resources :activities, only: [:index, :show]
  resources :participations, only: [:create]

  get '/auth/facebook', as: :facebook_auth
  root :to => 'activities#index'
end
