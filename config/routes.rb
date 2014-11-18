Rails.application.routes.draw do
  devise_for :users
  get 'wikis/create'

  get 'wikis/destroy'

  get 'wikis/edit'

  get 'wikis/show'

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'
end
