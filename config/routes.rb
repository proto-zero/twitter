Rails.application.routes.draw do
  root 'viewer#index'

  get 'index', to: 'viewer#index'
  get 'index/:id', to: 'viewer#show'
end
