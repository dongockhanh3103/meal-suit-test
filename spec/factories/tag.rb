# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    label { Faker::Name.unique.name }
  end
end
