Eve::Application.routes.draw do

  root 'places#index'

  resources :places,  except: [:show]
  resources :tags,    only:   [:index, :create]

  get 'api/places(/:tag)' => 'api#places'
  get 'api/tags'          => 'api#tags'

end
