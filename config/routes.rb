Desk::Application.routes.draw do
  #root 'welcome#index'

  resources :filters
  resources :cases

  namespace :api do
    namespace :v1 do
      resources :cases
    end
  end

end
