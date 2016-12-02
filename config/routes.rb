Rails.application.routes.draw do
  resources :photos

  get 'thumb/:token/:version', to: 'photos#thumb', as: :thumb

  root 'photos#index'
end