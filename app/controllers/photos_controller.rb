class PhotosController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :create

  before_action :allow_iframe, only: :create

  def index
    @photo = Users::Photos::Form.new(@user.photos.build)
    @photos = @user.photos.where.not(id: nil)
  end

  def thumb
    photo = Photo.find_by_token params[:token]
    filename = Rails.root.join('public', 'uploads', 'photos', photo.token, "#{params[:version]}_image.jpg")
    unless File.exist? filename
      filename = photo.generate_thumb(version: params[:version].to_sym)
    end
    send_file filename, type: 'image/jpeg', disposition: 'inline'
  end

  def create
    if params[:photo][:type] && params[:photo][:type] == 'webcam_data' && params[:photo][:image]
      io = LoventineStringIO.new(Base64.decode64((params[:photo][:image]).match(%r{^data:(.*?);(.*?),(.*)$})[3]))
      @photo_form = Users::Photos::Form.new(@user.photos.build(image: io))
    else
      @photo_form = Users::Photos::Form.new(Photo.new)
    end
    if @photo_form.save(photo_params)
      @redirect = params[:photo][:redirect].sub ':id', @photo_form.photo.id.to_s
      render :create
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:is_avatar, :user_id, :state, :image, :remote_image_url,
      :x, :y, :w, :h, :angle, :scale)
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end