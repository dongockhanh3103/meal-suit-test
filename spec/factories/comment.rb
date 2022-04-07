# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user_name { Faker::Name.unique.name }
    content { Faker::Lorem.sentence }

    photo
  end
end
