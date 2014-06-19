Eve::Application.routes.draw do
  root 'places#index'

  resources :places,  except: [:show]
  resources :tags,    only:   [:index, :create]
end
