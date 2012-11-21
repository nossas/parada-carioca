ParadaCarioca::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  
  resources :activities, only: [:show] do 
    resources :events, only: [:index, :show]
  end

  get '/auth/facebook', as: :facebook_auth
  root :to => 'events#index'
end
