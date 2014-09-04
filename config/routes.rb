Desk::Application.routes.draw do
  #root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :cases
    end
  end

end
