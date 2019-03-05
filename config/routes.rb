Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :designs
  resources :technologies, only: :index
  resources :suggestions, only: :create
  
  root 'designs#index'
end
