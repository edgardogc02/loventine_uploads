module Photos
  class BackupJob < ApplicationJob

    def perform(photo_id)
      photo = Photo.find(photo_id)
      Photos::Backup.call(photo)
    end

  end
end