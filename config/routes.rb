Rails.application.routes.draw do
resources :users
resources :lists
resources :leads
# get '/search', to: 'leads#search'
# post '/search', to: 'leads#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
