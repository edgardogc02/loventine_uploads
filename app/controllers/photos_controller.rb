class PhotosController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :update

  before_action :validate_token, only: :update

  def update
    photo = Photo.find(params[:id])
    photo.image.recreate_versions!
    respond_to do |format|
      format.json do
        head :ok
      end
    end
  end

  def show
    photo = Photo.find_by_token params[:token]
    filename = photo.image.path
    send_file filename, type: 'image/jpeg', disposition: 'inline'
  end

  protected

  def validate_token
    unless ApiKeys::Validate.call(params[:photo][:user_id], params[:photo][:token])
      head status: :unauthorized
    end
  end
end