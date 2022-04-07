# frozen_string_literal: true

# == Schema Information
#
# Table name: tags_sources
#
#  id         :bigint           not null, primary key
#  source_id  :bigint
#  tag_id     :bigint
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TagsPhoto < TagsSource
end
