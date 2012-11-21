ParadaCarioca::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  

  get '/auth/facebook', as: :facebook_auth
  root :to => 'activities#index'
end
