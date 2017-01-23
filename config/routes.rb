Rails.application.routes.draw do
  namespace 'photos' do
    post 'webcam', to: 'webcam#create'
    post 'ajax', to: 'ajax#create'
    post 'classic', to: 'classic#create'
    post 'facebook', to: 'facebook#create'
  end

  resources :photos, only: [:update]

  # hash is needed for (cleaning) caching purposes
  get 'photo/:token/:hash/image.jpg', to: 'photos#show'
  get 'thumb/:token/:hash/:version/image.jpg', to: 'thumbs#show'

  match 'photos/copy_from_remote/:id', to: 'photos#copy_from_remote', via: [:put, :patch]

  # hash is needed for (cleaning) caching purposes
  get 'love_story/:token/:hash/image.jpg', to: 'love_stories#show'
  get 'love_story_thumb/:token/:hash/:version/image.jpg', to: 'love_stories#thumb'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiqo'
end