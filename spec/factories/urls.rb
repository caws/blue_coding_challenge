FactoryBot.define do
  factory :url do
    short_url { nil }
    full_url { Faker::Internet.url }
    page_title { Faker::Movies::Hobbit.character }
    hit_counter { 0 }
  end
end
