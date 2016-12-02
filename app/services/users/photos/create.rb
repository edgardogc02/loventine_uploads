module Users
  module Photos
    class Create
      attr_accessor :photo

      delegate :user, :section_id, to: :photo

      def initialize(photo)
        @photo = photo
      end

      def save
        generate_token and @photo.save # && after_callbacks
      end

      private

      def after_callbacks
        create_completed_section && moderate
      end

      def create_completed_section
        if !user.user_completed_sections.completed_section?(section_id)
          user.user_completed_sections.build(section_id: section_id).save
          user.update_profile_completeness_percent(Section.find(section_id).percentage)
        else
          true
        end
      end

      def generate_token
        begin
          photo.token = SecureRandom.urlsafe_base64
        end while Photo.exists?(token: photo.token)
        true
      end

      def moderate
        begin
          UserPhotos::ModerateJob.perform_later(photo.id)
        rescue Redis::CannotConnectError
          PendingJob.create(worker_class_name: 'UserPhotos::ModerateJob', params: [photo.id])
        end
      end
    end
  end
end