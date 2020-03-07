FactoryBot.define do
  factory :tweet do
    title {"test"}
    content {Faker::Lorem.sentence}
    user 
    topic
  end
end