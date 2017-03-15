Rails.application.routes.draw do
  root   'bookmarks#index'

  get    '/login',            to: 'sessions#new'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'
  get    '/signup',           to: 'users#new'
  post   '/signup',           to: 'users#create'
  get    '/search/:query',    to: 'bookmarks#search'
  get    '/search',           to: 'bookmarks#search'
  get    '/sites',            to: 'sites#index'

  resources :tags do
    resources :bookmarks
  end
  resources :users
  resources :bookmarks
end
