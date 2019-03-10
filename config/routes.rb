Rails.application.routes.draw do
  get 'stores/index'
  get 'stores/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :designs
  resources :technologies, only: :index
  resources :suggestions, only: :create
  resources :stores
  
  
  root 'designs#index'
end
