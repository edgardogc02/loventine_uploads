module Uploads
  class BaseController < ApplicationController

    skip_before_action :verify_authenticity_token, only: :create

    before_action :allow_iframe, :validate_token, only: :create

    protected

    def upload_params
      params.require(:photo).permit!
    end

    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end

    def validate_token
      unless ApiKeys::Validate.call(params[:photo][:user_id], params[:photo][:token])
        @redirect = params[:photo][:redirect].sub ':id', '0'
        render :create, status: 401
      end
    end

    def redirect_url
      params[:photo][:redirect].sub ':id', @photo_form.photo.id.to_s
    end
  end
end