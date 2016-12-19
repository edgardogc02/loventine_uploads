module Photos
  class Destroy
    def self.call(photo)
      photo.remove_image!
      FileUtils.remove_dir(Rails.root.join('public', photo.image.store_dir), force: true)
    end
  end
end