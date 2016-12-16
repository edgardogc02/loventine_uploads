Rails.application.routes.draw do
  namespace 'uploads' do
    post 'webcam', to: 'webcam#create'
    post 'ajax', to: 'ajax#create'
    post 'classic', to: 'classic#create'
    post 'facebook', to: 'facebook#create'
  end

  resources :photos, only: [:update]

  # hash is needed for (cleaning) caching purposes
  get 'photo/:token/:hash/image.jpg', to: 'photos#show'
  get 'thumb/:token/:hash/:version/image.jpg', to: 'thumbs#show'
end