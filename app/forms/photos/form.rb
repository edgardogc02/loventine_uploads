module Photos
  class Form

    include ActiveModel::Model

    attr_accessor :photo

    delegate :image, :state, :user_id, :is_avatar, :x, :y, :w, :h, :remote_image_url, :scale, :angle, to: :photo

    # validations

    validates :image, presence: true
    validates :state, presence: true
    validates :user_id, presence: true
    validates :is_avatar, inclusion: [true, false]

    def initialize(photo)
      @photo = photo
    end

    def persisted?
      @photo.persisted?
    end

    def id
      @photo.id
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Photo')
    end

    def save(params)
      prepare_to_save(params)
    end

    private

    def prepare_to_save(params)
      photo.attributes = params.slice(:is_avatar, :state, :image, :remote_image_url, :x, :y, :w, :h,
        :angle, :scale, :user_id)
      photo.state = :pending
      # dont let the user upload multiple avatars
      photo.is_avatar = false if is_avatar == true && Photo.avatar_for_user(user_id).any?
    end
  end
end