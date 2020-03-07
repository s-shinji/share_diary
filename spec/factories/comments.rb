FactoryBot.define do
  factory :comment do
    text {Faker::Lorem.sentence}
    tweet
    topic
    user
  end
end