FactoryBot.define do
  factory :image do
    src {File.open("#{Rails.root}/app/assets/images/default.jpeg")}
    tweet
  end
end