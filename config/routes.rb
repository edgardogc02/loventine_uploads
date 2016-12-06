Rails.application.routes.draw do
  resources :photos, only: :create

  get 'thumb/:token/:version', to: 'photos#thumb', as: :thumb
end