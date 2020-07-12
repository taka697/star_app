Rails.application.routes.draw do

  # post 'comments/create'
  # delete 'comments/destroy'
  resources :comments

  get 'favorites/create'
  get 'favorites/destroy'
  root 'tweets#index'

  devise_for :users
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
