Rails.application.routes.draw do

  root "projects#index"

  resources :projects do
    resources :tickets
  end

  resources :users
  get 'users/new'
  get 'users/create'
  get 'users/show'

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
