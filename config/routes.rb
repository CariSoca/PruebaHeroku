Rails.application.routes.draw do 	
  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :estimation_sessions, :partial_estimations, :projects,
  					:stories, :users, :home

	post '/EstimationSessions/:id', to: 'estimation_sessions#single_person_estimation'

	post '/EstimationSessions/:id', to: 'estimation_sessions#single_person_estimation'

  get  '/Projects/share', to: 'projects#share'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

end
