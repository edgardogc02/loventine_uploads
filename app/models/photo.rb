class Photo < ApplicationRecord
  self.table_name = 'user_photos'

  mount_uploader :image, PhotoLocalUploader

  scope :avatar_for_user, ->(user_id) { where(user_id: user_id).where(is_avatar: true) }

  # 0 is an unused state
  enum state: { approved: 1, pending: 2, rejected: 3, deleted: 4, banned: 5 }

  belongs_to :user

  def thumb_hash
    Digest::MD5.hexdigest(x.to_s + y.to_s + w.to_s + h.to_s + angle.to_s)
  end

  def lala
    "/photo/#{token}/#{thumb_hash}/image.jpg"
  end
end