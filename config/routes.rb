ParadaCarioca::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  get '/meurio', to: redirect('http://meurio.org.br'), as: :meurio 
  get '/activities/search', :to => 'activities#search'

  resources :activities, except: [:destroy] do
    resources :events, only: [:index, :create, :new]
  end
  
  resources :participations, only: [:create, :show]
  
  resources :users, only: [:update] do
    resources :participations, only: [:index]
  end

  get '/auth/facebook', as: :facebook_auth
  root :to => 'activities#index'
end
