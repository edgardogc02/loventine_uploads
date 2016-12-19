class PhotosController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create, :update]

  before_action :validate_update_token, only: :update

  before_action :allow_iframe, :validate_create_token, only: :create

  # TODO: before update check that user can perform update
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

  def validate_update_token
    unless ApiKeys::Validate.call(params[:photo][:user_id], params[:photo][:token])
      head status: :unauthorized
    end
  end

  protected

  def upload_params
    params.require(:photo).permit!
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def validate_create_token
    unless ApiKeys::Validate.call(params[:photo][:user_id], params[:photo][:token])
      @redirect = params[:photo][:redirect].sub ':id', '0'
      render 'photos/ajax/create', status: :unauthorized
    end
  end

  def redirect_url
    params[:photo][:redirect].sub ':id', @photo_form.photo.id.to_s
  end

end