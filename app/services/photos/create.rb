module Photos
  class Create
    attr_accessor :photo

    delegate :user_id, to: :photo

    def initialize(photo)
      @photo = photo
    end

    def save
      generate_token && @photo.save && backup
    end

    private

    def generate_token
      loop do
        photo.token = SecureRandom.urlsafe_base64
        break unless Photo.exists?(token: photo.token)
      end
      true
    end

    def backup
      Photos::Backup.call(photo)
    end
  end
end