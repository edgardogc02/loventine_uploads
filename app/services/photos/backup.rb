module Photos
  class Backup
    def self.call(photo)
      photo.remote_image_bck_url = Figaro.env.host + photo.image_url
      photo.save
    end
  end
end