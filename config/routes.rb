Rails.application.routes.draw do
  root "static_pages#home"
  get 'home'     => 'static_pages#home'
  get 'login'    => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete'logout' => 'sessions#destroy'
  resources :users, only: [:show, :edit, :update]
  namespace :suppervisor do
    resources "users"
    resources "courses"
  end
end
