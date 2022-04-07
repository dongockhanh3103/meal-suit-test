# frozen_string_literal: true

class PhotoResource < BaseResource

  ATTRIBUTES = %i[
    name
    short_description
    shoot_date
    gallery_id
    source_url
    created_at
    updated_at
  ].freeze

  EXCEPT_TEST_ATTRIBUTES = %i[
    created_at
    updated_at
    shoot_date
  ].freeze

  attributes(*ATTRIBUTES)

end
