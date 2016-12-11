module Thumbs
  class Generate
    attr_accessor :photo

    def initialize(photo)
      @photo = photo
    end

    def call(version)
      filename = photo.image.send(version.to_sym).path
      source = ::Magick::Image.read(photo.image.path).first
      source = source.resize_to_fill(Thumb[version.to_sym].height, Thumb[version.to_sym].width, ::Magick::CenterGravity)
      source.write(filename)
      filename
    end
  end
end