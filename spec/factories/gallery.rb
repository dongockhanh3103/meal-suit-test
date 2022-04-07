# frozen_string_literal: true

FactoryBot.define do
  factory :gallery do
    name { Faker::Name.unique.name }
    short_description { Faker::Lorem.sentence }
  end
end
