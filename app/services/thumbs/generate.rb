module Thumbs
  class Generate
    attr_accessor :photo

    def initialize(photo)
      @photo = photo
    end

    def call(version)
      photo.image.recreate_versions!(version)
      photo.image.send(version.to_sym).path
    end
  end
end