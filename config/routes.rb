Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'expenses/index'
  resources :expenses
  resources :incomes
  root 'welcome#index'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
