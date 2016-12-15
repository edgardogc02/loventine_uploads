module Uploads
  class AjaxController < Uploads::BaseController
    def create
      @photo_form = Photos::Form.new(Photo.new)
      if @photo_form.save(upload_params)
        @redirect = redirect_url
        render :create
      else
        render :new
      end
    end
  end
end