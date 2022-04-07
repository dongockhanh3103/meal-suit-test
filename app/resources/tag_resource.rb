# frozen_string_literal: true

class TagResource < BaseResource

  ATTRIBUTES = %i[
    label
    created_at
    updated_at
  ].freeze

  EXCEPT_TEST_ATTRIBUTES = %i[
    created_at
    updated_at
  ].freeze

  attributes(*ATTRIBUTES)

end
