module Photos
  class AjaxController < PhotosController
    def create
      @photo_form = Photos::Form.new(Photo.new)
      @photo_form.save(upload_params)
      @redirect = @photo_form.redirect_url
      render :create
    end
  end
end