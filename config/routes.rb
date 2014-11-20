Rails.application.routes.draw do
  devise_for :users

  resources  :users, only: [:show, :update] do
    resources :wikis
  end

  get 'about' => 'weclome#about'

  root to: 'welcome#index'
end
