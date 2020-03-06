Rails.application.routes.draw do

  resources :users
  resources :leadnotes
    post '/leadnotes/create', to: 'leadnotes#create'
    get '/leadnotes/:id', to: 'leadnotes#show'
    post '/leadnotes/update', to: 'leadnotes#update'
  root 'welcome#index'

  #  AL API/V ROUTES

  namespace :api do
    namespace :v1 do
      # LEADS ROUTES
      resources :leads

      #  LIST ROUTES
      resources :lists
      post '/lists', to: 'lists#create'
      get '/lists/show_lists/:id', to: 'lists#show_lists'
      # get 'lists/show_special/:id', to: 'lists#show_special'
      post '/lists/show_special', to: 'lists#show_special'
      get '/lists/show_special_all/:id', to: 'lists#show_special_all'

      #  AUTH ROUTES
      post '/auth', to: 'auth#create'
      post '/login', to: 'auth#login'
      get '/current_user', to: 'auth#show'

      #  LEADLIST ROUTES
      resources :leadlists
      delete '/leadlists', to: 'leadlists#destroy'
      # post '/leadnotes/create', to: 'leadnotes#new'
      # post '/leadnotes/show', to: 'leadnotes#show'

    end
  end

end
