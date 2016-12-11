Rails.application.routes.draw do
  namespace 'uploads' do
    post 'webcam', to: 'webcam#create'
    post 'ajax', to: 'ajax#create'
    post 'classic', to: 'classic#create'
    post 'facebook', to: 'facebook#create'
  end
  get 'thumb/:token/:version', to: 'thumbs#show'
end