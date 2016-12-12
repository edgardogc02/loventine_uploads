FactoryGirl.define do
  factory :photo do
    user
    state { :pending }
    is_avatar false
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'image.jpg')) }

    after(:build) do |photo|
      photo.token = SecureRandom.urlsafe_base64
    end

    trait :avatar do
      is_avatar true
    end
  end
end
