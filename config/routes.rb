Rails.application.routes.draw do

  namespace :admins_backoffice do
    get 'welcome/index' # Dashboards
    resources :admins #Administradores
    resources :subjects #Assuntos
    resources :questions #Perguntas
  end

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
    get 'zip_code', to: 'zip_code#show'
  end

  devise_for :users
  devise_for :admins, skip: [:registrations]

  get 'backoffice', to: 'admins_backoffice/welcome#index'

  root to: "site/welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
