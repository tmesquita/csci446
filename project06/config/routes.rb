Gamez::Application.routes.draw do
  resources :games

  root :to => 'home#index'
  resources :users, :user_sessions

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  namespace :admin do
    resources :users
    resources :games
  end

  namespace :members do
    resources :users, :only => [:edit, :update]
    resources :games
    root :to => 'members#index'
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
