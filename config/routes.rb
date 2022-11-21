Rails.application.routes.draw do
  resources :articles

  resources :users

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'
  get 'session', to: 'sessions#current_session'

  resources :categories, except: [:destroy]

end
