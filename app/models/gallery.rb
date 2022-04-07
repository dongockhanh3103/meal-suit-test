# frozen_string_literal: true

# == Schema Information
#
# Table name: galleries
#
#  id                :bigint           not null, primary key
#  name              :string           default(""), not null
#  short_description :text             default(""), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Gallery < ApplicationRecord

  has_many :photos, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }, presence: true
  validates :short_description, presence: true

end
