# frozen_string_literal: true

class GalleryResource < BaseResource

  ATTRIBUTES = %i[
    name
    short_description
    created_at
    updated_at
  ].freeze

  EXCEPT_TEST_ATTRIBUTES = %i[
    created_at
    updated_at
  ].freeze

  attributes(*ATTRIBUTES)

end
