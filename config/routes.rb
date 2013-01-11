ParadaCarioca::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  get '/meurio', to: redirect('http://meurio.org.br'), as: :meurio 
  get '/activities/search', :to => 'activities#search'

  resources :activities, except: [:destroy] do
    resources :events
    resources :reviews
  end
  
  resources :participations, only: [:create, :show]
  post "moip_callback", :to => "participations#moip_callback", :as => "moip_callback"
  
  resources :users, only: [:update, :show] do
    resources :participations, only: [:index]
  end

  get '/auth/facebook', as: :facebook_auth
  root :to => 'activities#index'
end
