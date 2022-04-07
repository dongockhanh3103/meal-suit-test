# frozen_string_literal: true

# == Schema Information
#
# Table name: photos
#
#  id                :bigint           not null, primary key
#  name              :string           default(""), not null
#  short_description :text             default("")
#  shoot_date        :datetime
#  gallery_id        :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Photo < ApplicationRecord

  include Rails.application.routes.url_helpers

  belongs_to :gallery, optional: true
  has_many :comments, dependent: :destroy
  has_one_attached :source

  validates :name, uniqueness: { case_sensitive: false }, presence: true

  def source_url
    rails_blob_url(source, only_path: true) if source.attached?
  end

end
