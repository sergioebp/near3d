Rails.application.routes.draw do
  get 'printers/index'
  get 'userstores/destroy'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :designs
  resources :technologies, only: :index
  resources :suggestions, only: :create
  resources :stores do 
    resources :printers, only: [:show, :create, :edit, :update, :destroy]  
    member do
      post 'stores/add_vendor'
    end
  end
  resources :userstores, only: :destroy
  
  
  
  root 'designs#index'
end
