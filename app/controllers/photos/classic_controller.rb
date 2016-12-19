module Photos
  class ClassicController < PhotosController
    def create
      @photo_form = Photos::Form.new(Photo.new)
      if @photo_form.save(upload_params)
        @redirect = redirect_url
        response.header['Location'] = @redirect
        head :see_other # code 303
      else
        render :new
      end
    end
  end
end