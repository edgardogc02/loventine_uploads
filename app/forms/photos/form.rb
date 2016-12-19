module Photos
  class Form

    include ActiveModel::Model

    attr_accessor :photo, :error_redirect_url

    delegate :id, :image, :image=, :state, :state=, :user_id, :user_id=, :is_avatar, :is_avatar=, :x, :y, :w, :h,
      :remote_image_url, :scale, :angle, to: :photo

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

    def redirect_url
      persisted? ? success_redirect_url : error_redirect_url
    end

    def save(params)
      prepare_to_save(params)
      Photos::Create.new(photo).save if valid?
    end

    private

    def prepare_to_save(params)
      photo.attributes = params.slice(:is_avatar, :image, :remote_image_url, :x, :y, :w, :h, :angle, :scale, :user_id)
      photo.state = :pending
      # dont let the user upload multiple avatars
      photo.is_avatar = false if force_album?
      @success_redirect_url = params[:success_redirect_url]
      @error_redirect_url = params[:error_redirect_url]
    end

    def success_redirect_url
      @success_redirect_url.sub ':id', id.to_s
    end

    # just force album when is a new photo, marked as avatar and another avatar is already there
    def force_album?
      photo.new_record? && is_avatar == true && Photo.avatar_for_user(user_id).any?
    end
  end
end