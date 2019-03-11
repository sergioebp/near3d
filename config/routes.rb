Rails.application.routes.draw do
  get 'userstores/destroy'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :designs
  resources :technologies, only: :index
  resources :suggestions, only: :create
  resources :stores do   
    member do
      post 'stores/add_vendor'
    end
  end
  resources :userstores, only: :destroy
  
  
  root 'designs#index'
end
