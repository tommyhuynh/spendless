Rails.application.routes.draw do
  get 'home/index'
  get 'graphs', to: 'home#graphs'
  resources :expenses
  root 'expenses#index'
  resources :categories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
