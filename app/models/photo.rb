class Photo < ApplicationRecord
  self.table_name = 'user_photos'

  mount_uploader :image, PhotoLocalUploader

  scope :avatar_for_user, ->(user_id) { where(user_id: user_id).where(is_avatar: true) }

  # 0 is an unused state
  enum state: { approved: 1, pending: 2, rejected: 3, deleted: 4, banned: 5 }

  def generate_thumb(version: :mini)
    filename = image.send(version).file.file
    source = ::Magick::Image.read(image.path).first
    source = source.resize_to_fill(height(version), width(version), ::Magick::CenterGravity)
    source.write(filename)
    filename
  end

  private

  def height(version)
    case version
    when :mini
      50
    when :small
      100
    when :medium
      150
    when :big
      200
    end
  end

  alias :width :height

end