class Photo < ApplicationRecord
  self.table_name = 'user_photos'

  mount_uploader :image, PhotoLocalUploader

  scope :avatar_for_user, ->(user_id) { where(user_id: user_id).where(is_avatar: true) }

  # 0 is an unused state
  enum state: { approved: 1, pending: 2, rejected: 3, deleted: 4, banned: 5 }
end