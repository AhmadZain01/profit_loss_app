Rails.application.routes.draw do
  devise_for :users
  get 'expenses/index'
  resources :expenses
  root 'welcome#index'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
