Eve::Application.routes.draw do

  root 'places#index'

  resources :places,  except: [:show]
  get 'places/:id/delete'  => 'places#destroy'

  resources :tags,    only:   [:index, :create]

  get 'api/places(/:tag)' => 'api#places'
  get 'api/tags'          => 'api#tags'

end
