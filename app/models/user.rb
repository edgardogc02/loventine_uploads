class User < ApplicationRecord
  has_many :photos

  has_one :avatar, -> { where(is_avatar: true) }, class_name: 'Photo', foreign_key: 'user_id'
end