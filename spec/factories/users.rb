FactoryGirl.define do
  factory :user do
    provider "Google"
    uid "1234"
    first_name "Jesse"
    last_name "Spevack"
    email "jesse@example.com"
    token "my_token"
    refresh_token "another_token"
    expires_at "1477945241"
    role 0

    factory :admin do
      role 1
    end

  end
end
