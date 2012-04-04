Gamez::Application.routes.draw do
  resources :users, :user_sessions, :games, :roles
  
  root :to => 'home#index'

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'register' => 'users#new', :as => :register
  
  namespace :admin do
    resources :users
    match 'me' => 'users#edit'
    resources :games
    resources :roles
    root :to => 'games#index'
  end

  namespace :member do
    resources :users, :only => [:edit, :update]
    match 'me' => 'users#edit'
    resources :games
    root :to => 'games#index'
    
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
