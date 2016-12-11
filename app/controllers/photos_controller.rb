class PhotosController < Uploads::BaseController

  def thumb
    photo = Photo.find_by_token params[:token]
    filename = Rails.root.join('public', 'uploads', 'photos', photo.token, "#{params[:version]}_image.jpg")
    unless File.exist? filename
      filename = photo.generate_thumb(version: params[:version].to_sym)
    end
    send_file filename, type: 'image/jpeg', disposition: 'inline'
  end

  def create
    @photo_form = Users::Photos::FormCreate.new(Photo.new)
    if @photo_form.save(upload_params)
      @redirect = redirect_url
      if params[:photo][:type] == 'jquery_upload'
        render :create
      else
        response.header['Location'] = @redirect
        head :see_other # code 303
      end
    else
      render :new
    end
  end
end