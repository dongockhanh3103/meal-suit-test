# frozen_string_literal: true

FactoryBot.define do
  factory :tags_source do
    source_id { nil }
    tag

    trait :photo do
      type { TagsPhoto.name }
    end

    trait :gallery do
      type { TagsGallery.name }
    end
  end
end
