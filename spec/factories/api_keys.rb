FactoryGirl.define do
  factory :api_key do
    user
    token { SecureRandom.hex(64) }
    api 'uploads'
  end
end
