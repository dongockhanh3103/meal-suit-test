# frozen_string_literal: true

class CommentResource < BaseResource

  ATTRIBUTES = %i[
    user_name
    content
    photo_id
    created_at
  ].freeze

  EXCEPT_TEST_ATTRIBUTES = %i[
    created_at
  ].freeze

  attributes(*ATTRIBUTES)

end
