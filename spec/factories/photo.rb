# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    name { Faker::Name.unique.name }
    short_description { Faker::Lorem.sentence }
    shoot_date { Time.current }

    gallery
  end
end
