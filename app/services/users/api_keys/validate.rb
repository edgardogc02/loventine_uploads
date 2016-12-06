module Users
  module ApiKeys
    class Validate
      def self.call(user_id, token)
        ::ApiKey.where(user_id: user_id).where(token: token).where(api: 'uploads').any?
      end
    end
  end
end