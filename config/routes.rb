Rails.application.routes.draw do
resources :users
resources :lists
# resources :leads
resources :leadlists
resources :leadnotes

namespace :api do
  namespace :v1 do
    resources :categories
    resources :leads
    # resources :lists
    post '/lists', to: 'lists#create'
    post '/auth', to: 'auth#create'
    post '/login', to: 'auth#login'
    post '/current_user', to: 'auth#show'
    resources :leadlists
  end
end
# get '/search', to: 'leads#search'
# post '/search', to: 'leads#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root 'welcome#index'

# # LOGIN LOGOUT ROUTES
# post '/login', to: 'auth#create'
# delete '/logout', to: 'auth#destroy'

# # NEW USER SET UP
# post '/newuser', to: 'users#create'

# # YELP SEARCH
# post '/search', to: 'leads#search'

# # LIST POST
# post '/newlist', to: 'lists#create'

# # LEADS POST
# post '/newlead', to: 'leads#create'

# # LEADSLIST POST
# post '/newleadlist', to: 'leadlists#create'

# # LEADNOTES POST 
# post '/newleadnote', to: 'leadnotes#create'

# #ALL CATEGORIES
get '/categories', to: 'categories#index'

# #edit user details
# get '/users/:id/edit', to: 'users#update'
end
