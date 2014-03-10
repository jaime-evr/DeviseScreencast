FactoryGirl.define do
  factory :user do
    email 'user@email.com'
    password 'asdf1234'
    password_confirmation 'asdf1234'
  end
end
