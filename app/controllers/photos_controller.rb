class PhotosController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create, :update, :copy_from_remote, :destroy]

  before_action :validate_update_token, :validate_user_and_photo, only: [:update, :copy_from_remote, :destroy]

  before_action :allow_iframe, :validate_create_token, only: :create

  def index
    @photos = Photo.last(2)
  end

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

  def copy_from_remote
    photo = Photo.find params[:id]
    if photo.image.blank?
      photo.remote_image_url = params[:photo][:remote_image_url]
      photo.save
    end
    respond_to do |format|
      format.json do
        head :ok
      end
    end
  end

  def destroy
    photo = Photo.find params[:id]

    Photos::Destroy.call(photo)
    respond_to do |format|
      format.json do
        head :ok
      end
    end
  end

  protected

  def upload_params
    params.require(:photo).permit!
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def validate_user_and_photo
    unless Photo.where(id: params[:id]).where(user_id: params[:photo][:user_id]).any?
      head status: :unauthorized
    end
  end

  def validate_update_token
    unless ApiKeys::Validate.call(params[:photo][:user_id], params[:photo][:token])
      head status: :unauthorized
    end
  end

  def validate_create_token
    unless ApiKeys::Validate.call(params[:photo][:user_id], params[:photo][:token])
      @redirect = params[:photo][:error_redirect_url]
      render 'photos/ajax/create', status: :unauthorized
    end
  end
end