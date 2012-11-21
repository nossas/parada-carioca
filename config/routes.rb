ParadaCarioca::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  
  resources :activities, only: [:index, :show]

  get '/auth/facebook', as: :facebook_auth
  root :to => 'activities#index'
end
