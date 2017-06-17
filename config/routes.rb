Rails.application.routes.draw do
  get 'home/index'
  resources :expenses
  root 'expenses#index'
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
