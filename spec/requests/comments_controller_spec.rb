# frozen_string_literal: true

require 'rails_helper'

describe CommentsController.name, type: :request do
  let!(:gallery) { create(:gallery) }
  let!(:photo)   { create(:photo, gallery: gallery) }
  let!(:data)    { create_list(:comment, 5, photo: photo) }
  let!(:create_params) do
    {
      data: {
        attributes: {
          user_name: 'John Doe',
          conent: 'Sample Content',
          photo_id: photo.id
        }
      }
    }
  end

  include_examples 'acts examples', Comment
end
