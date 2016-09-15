<<<<<<< HEAD
Rails.application.routes.draw do 	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :estimation_sessions, :partial_estimations, :projects,
  					:stories, :users, :share


end
=======
Rails.application.routes.draw do 	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :estimation_sessions, :partial_estimations, :projects,
  					:stories, :users

	post '/EstimationSessions/:id', to: 'estimation_sessions#single_person_estimation'


end
>>>>>>> develop
