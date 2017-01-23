class LoveStory < ApplicationRecord
  mount_uploader :image, LoveStoryLocalUploader
end