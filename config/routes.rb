Rails.application.routes.draw do
  root  'home#index',               as: 'root'
  get   '/auth/google',             as: 'login'
  get   'auth/:provider/callback',  to: 'sessions#create'
  get   'logout',                   to: 'sessions#destroy'

  resources :photos, only: [:new, :index]
end
