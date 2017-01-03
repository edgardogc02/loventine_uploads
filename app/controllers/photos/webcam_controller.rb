module Photos
  class WebcamController < PhotosController
    def create
      io = LoventineStringIO.new(Base64.decode64((params[:photo][:image]).match(/^data:(.*?);(.*?),(.*)$/)[3]))
      @photo_form = Photos::Form.new(Photo.new(image: io))
      @photo_form.save(upload_params)
      head :see_other, location: @photo_form.redirect_url # code 303
    end
  end
end