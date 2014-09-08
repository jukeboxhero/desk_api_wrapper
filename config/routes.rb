Desk::Application.routes.draw do
  root 'dashboard#index'

  resources :filters
  resources :cases
  resources :labels

end
