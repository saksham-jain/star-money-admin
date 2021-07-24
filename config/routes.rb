Rails.application.routes.draw do
  namespace :admin do
    devise_for :admin_users, controllers: { sessions: 'admin/admin_users/sessions' }
    root to: 'dashboard#index'
    get 'dashboard', to: 'dashboard#index'
    resources :clients do
      get :bulk_upload, on: :collection
      post :bulk_upload, on: :collection
    end
    resources :trades, only: :index do
      get :bulk_upload, on: :collection
      post :bulk_upload, on: :collection
    end
    resources :queries
  end

  scope module: 'user' do
    devise_for :clients, controllers: { sessions: 'user/clients/sessions' }
    root to: 'dashboard#index'
    get '/profile' => 'clients#show', as: :profile
    resources :dashboard, only: :index
    resources :downloads, only: :index
    resources :queries
  end
  
end
