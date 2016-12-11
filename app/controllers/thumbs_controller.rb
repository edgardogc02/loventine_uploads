class ThumbsController < ApplicationController
  def show
    photo = Photo.find_by_token params[:token]
    filename = photo.image.send(params[:version].to_sym).path
    unless File.exist? filename
      filename = Thumbs::Generate.new(photo).call(params[:version].to_sym)
    end
    send_file filename, type: 'image/jpeg', disposition: 'inline'
  end
end