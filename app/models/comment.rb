# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_name  :string           not null
#  content    :text             default("")
#  photo_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

  belongs_to :photo
  validates :user_name, presence: true

end
