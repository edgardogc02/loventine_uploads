module Uploads
  class ClassicController < Uploads::BaseController

    def create
      @photo_form = Users::Photos::FormCreate.new(Photo.new)
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