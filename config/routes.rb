Rails.application.routes.draw do
  get 'employment_entries/destroy', to: 'entries#destroy'
  get 'employment_entries/create', to: 'entries#create'
  resources :employment_entries, only: [:new, :create, :destroy]
  get 'interview/index'
  get 'top/jobs'
  get 'top/tag'
  get 'staff_signup/index'
  get 'company_login/index'
  get 'company_login/index'
  post 'company_login/auth'
  get 'company_login/logout'
  get 'entries/destroy', to: 'entries#destroy'
  get 'entries/create', to: 'entries#create'
  get 'stocks/destroy', to: 'stocks#destroy'
  get 'stocks/create', to: 'stocks#create'
  resources :entries
  resources :stocks
  get 'session/new'
  get 'session/destroy'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  get 'line/index'
  get 'line/contract'
  get 'recruitment_list/index'
  get 'get_photo/index'
  root 'top#index'
  resources :interests
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