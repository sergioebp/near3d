Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :designs
  resources :technologies, only: :index
  resources :suggestions, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'designs#index'
end
