Rails.application.routes.draw do
  root 'top#index'
  resources :interests
  resources :entry_sheets
  resources :students
  resources :recruitments
  resources :staffs
  resources :companies
  resources :occupations
  resources :industries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login/index'
  get 'login/logout'
  get 'staff_login/index'
  post 'login/auth'
  post 'staff_login/auth'
end