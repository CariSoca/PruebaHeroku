Rails.application.routes.draw do 	
  get 'users/create'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :estimation_sessions, :partial_estimations, :projects,
  					:stories, :users, :home

	post '/EstimationSessions/:id', to: 'estimation_sessions#single_person_estimation'

	post '/EstimationSessions/:id', to: 'estimation_sessions#single_person_estimation'

  get  '/Projects/share', to: 'projects#share'

  get 'auth/:provider/callback', to: 'users#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'users#destroy', as: 'signout'


end
