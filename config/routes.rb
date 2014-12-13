Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :update]
  resources :wikis
  resources :charges, only: [:create, :new]
 
  get 'refund_request_email', to: 'users#refund_request_email', as: :refund_request_email
  get 'about' => 'welcome#about'

  authenticated :user do
    root to: 'wikis#index', as: 'authenticated_root'
  end
  
  root to: 'welcome#index'
end
