Rails.application.routes.draw do
  devise_for :admin_users
  root to: 'dashboard#index'
  get '/dashboard', to: 'dashboard#index'
  resources :clients do
    get :bulk_upload, on: :collection
    post :bulk_upload, on: :collection
  end
end
