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
    exif_rotation
    save_geometry
    optimize_original_img
    rotate
    resize_to_limit(950, 950)
  end

  def save_geometry
    return if model.width.present?
    return unless file && model
    img = ::Magick::Image.ping(file.file).first
    model.width = img.columns
    model.height = img.rows
  end

  def optimize_original_img
    return if model.x.present?
    manipulate! do |img|
      img.strip!
    end
  end

  # Rotates or flips the image based on the image's EXIF orientation tag
  # auto_orient! does not work because if no exif is contains this method returns nil.
  def exif_rotation
    return if model.angle.present?
    manipulate! do |img|
      img.auto_orient
    end
  end

  def rotate
    return unless model.angle.present?
    manipulate! do |img|
      img.rotate(model.angle)
    end
  end

  def scale
    return unless model.scale.present? && !model.scale.zero?
    manipulate! do |img|
      img.scale!(model.scale.to_f)
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
    end
    resize_to_fill(width, height, Magick::CenterGravity)
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