module Uploads
  class WebcamController < Uploads::BaseController

    def create
      io = LoventineStringIO.new(Base64.decode64((params[:photo][:image]).match(/^data:(.*?);(.*?),(.*)$/)[3]))
      @photo_form = Users::Photos::FormCreate.new(Photo.new(image: io))

      if @photo_form.save(upload_params)
        response.header['Location'] = redirect_url
        head :see_other # code 303
      else
        render :new
      end
    end

  end
end