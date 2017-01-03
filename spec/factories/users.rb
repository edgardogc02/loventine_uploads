FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "#{FFaker::Internet.user_name} #{n}" }
    sequence(:email) { |n| "#{n}#{FFaker::Internet.email}" }
    password 'password'
    locale :es
    role_id { :regular }
    created_by 'test'
    search_position 0
    loggedin false
    confirmed_email false
    disabled false
    deleted false
    receive_email_notifications true
    profile_completeness_percent 0
    spammer false
    display_tour false
    banned false

    after(:build) do |user|
      user.auth_token = SecureRandom.urlsafe_base64
    end
  end
end
