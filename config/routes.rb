Rails.application.routes.draw do
  devise_for :admin_users
  root to: 'page#index'
end
