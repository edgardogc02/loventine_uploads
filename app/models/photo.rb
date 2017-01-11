class Photo < ApplicationRecord
  self.table_name = 'user_photos'

  mount_uploader :image, PhotoLocalUploader
  mount_uploader :image_bck, UserPhotoAmazonS3Uploader

  # scopes

  default_scope -> { where(deleted_at: nil) }

  scope :avatar_for_user, ->(user_id) { where(user_id: user_id).where(is_avatar: true) }

  # 0 is an unused state
  enum state: { approved: 1, pending: 2, rejected: 3, deleted: 4, banned: 5 }

  belongs_to :user
end