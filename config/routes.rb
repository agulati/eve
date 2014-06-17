Eve::Application.routes.draw do
  root 'places#index'

  resources :places, except: [:show]
end
