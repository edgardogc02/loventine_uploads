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

  Thumb.underscored_names.map(&:to_sym).each do |thumb|
    version thumb do
      process create_thumb: [Thumb[thumb].height, Thumb[thumb].width]
    end
  end


  def process_original_img
    rotate
    resize_to_limit(950, 950)
  end

  def rotate
    if model.angle.present?
      manipulate! do |img|
        img.rotate(model.angle)
      end
    end
  end

  def scale
    if model.scale.present? && !model.scale.zero?
      manipulate! do |img|
        img.scale!(model.scale.to_f)
      end
    end
  end

  def center_thumb(width, height)
    if model.x.present?
      x = model.x.to_i
      y = model.y.to_i
      w = model.w.to_i
      h = model.h.to_i
      manipulate! do |img|
        img.crop(x, y, w, h)
      end
      resize_to_fill(width, height, Magick::CenterGravity)
    else
      resize_to_fill(width, height, Magick::CenterGravity)
    end
  end

  def optimize
    manipulate! do |img|
      img.strip!
    end
  end

  def create_thumb(width, height)
    scale
    center_thumb(width, height)
    optimize
  rescue StandardError => e
    Rails.logger.error(e)
    ExceptionNotifier.notify_exception(e, data: { model: model.inspect, width: width, height: height })
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