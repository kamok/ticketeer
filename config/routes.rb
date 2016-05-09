Rails.application.routes.draw do

  root "projects#index"

  resources :projects do
    resources :tickets
  end

  resources :users

  get 'users/new'

  get 'users/create'

  get 'users/show'
end
