module Photos
  class ClassicController < PhotosController
    def create
      @photo_form = Photos::Form.new(Photo.new)
      @photo_form.save(upload_params)
      head :see_other, location: @photo_form.redirect_url # code 303
    end
  end
end