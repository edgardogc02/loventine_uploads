# encoding: utf-8

# This will upload the image to the server and save it on the image column.

class PhotoLocalUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/photos/#{model.token}"
  end

  # Process files as they are uploaded:
  process :process_original_img

  # Create different versions of your uploaded files:

  version :mini do
    process create_thumb: [50, 50]
  end

  version :small do
    process create_thumb: [100, 100]
  end

  version :big do
    process create_thumb: [200, 200]
  end

  version :medium do
    process create_thumb: [150, 150]
  end

  def process_original_img
    rotate
    resize_to_limit(950, 950)
  end

  def rotate
    if model.angle.present? and model.angle > 0
      manipulate! do |img|
        img.rotate(model.angle)
      end
    end
  end

  def create_thumb(width, height)
    begin

      if model.scale.present? && !model.scale.zero?
        manipulate! do |img|
          img.scale!(model.scale.to_f)
        end
      end

      if model.x.present?
        x = model.x.to_i
        y = model.y.to_i
        w = model.w.to_i
        h = model.h.to_i
        # resize_to_limit(550, 550) do |img|
        manipulate! do |img|
          img.crop(x, y, w, h)
        end
        # end
        resize_to_fill(width, height, Magick::CenterGravity)
      else
        resize_to_fill(width, height, Magick::CenterGravity)
      end

      manipulate! do |img|
        img.strip!
      end
    rescue Exception => e
      Rails.logger.error(e)
      ExceptionNotifier.notify_exception(e, data: { model: model.inspect, width: width, height: height })
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png bmp)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "image.#{file.extension.downcase}" if original_filename
  end
end