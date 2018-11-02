Rails.application.routes.draw do
  resources :followings, only: [:index]
  resources :rooms, only: [:index, :show]
  resources :schools, only: [:index, :show, :edit, :update]
  resources :teachers
  resources :employment_entries, only: [:new, :create, :destroy]
  get 'interview/index'
  get 'top/jobs'
  get 'top/tag'
  resources :entries, only: [:new, :create, :destroy]
  resources :stocks,  only: [:index, :create, :destroy]
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
  resources :recruitments
  resources :staffs
  resources :companies
  resources :occupations
  resources :industries
  get  'login/user'
  get  'login/staff'
  post 'login/staff_auth'
  get  'login/teacher'
  post 'login/teacher_auth'
  post 'login/auth'
  get  'login/logout'
  # mount ActionCable.server => '/cable'
end