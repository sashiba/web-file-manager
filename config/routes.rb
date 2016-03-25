Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    #get 'file_manager', on: :member, to: 'user_files#file_manager'
    resources :files, on: :member, only: [:new, :create, :destroy, :show, :index]
  end
end
