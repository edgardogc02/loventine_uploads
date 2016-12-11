module Uploads
  class AjaxController < Uploads::BaseController
    def create
      @photo_form = Users::Photos::FormCreate.new(Photo.new)
      if @photo_form.save(upload_params)
        @redirect = redirect_url
        render :create
      else
        render :new
      end
    end
  end
end