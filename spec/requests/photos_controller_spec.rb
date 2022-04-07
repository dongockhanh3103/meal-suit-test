# frozen_string_literal: true

require 'rails_helper'

describe PhotosController.name, type: :request do
  let!(:gallery) { create(:gallery) }
  let!(:data)    { create_list(:photo, 5, gallery: gallery) }
  let!(:create_params) do
    {
      data: {
        attributes: {
          name: Faker::Name.unique.name,
          short_description: 'Sample Short Description',
          gallery_id: gallery.id
        }
      }
    }
  end

  include_examples 'acts examples', Photo
end
