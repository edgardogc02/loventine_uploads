class ThumbsController < ApplicationController
  def show
    photo = Photo.find_by_token params[:token]
    filename = Rails.root.join('public', 'uploads', 'photos', photo.token, "#{params[:version]}_image.jpg")
    unless File.exist? filename
      filename = photo.generate_thumb(version: params[:version].to_sym)
    end
    send_file filename, type: 'image/jpeg', disposition: 'inline'
  end
end