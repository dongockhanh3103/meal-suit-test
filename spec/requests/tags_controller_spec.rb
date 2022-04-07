# frozen_string_literal: true

require 'rails_helper'

describe TagsController.name, type: :request do
  let!(:data) { create_list(:tag, 5) }
  let!(:create_params) do
    {
      data: {
        attributes: {
          label: 'Sample label'
        }
      }
    }
  end

  include_examples 'acts examples', Tag

  context 'when make tag' do
    let!(:tag) { create(:tag) }
    let!(:gallery) { create(:gallery) }
    let!(:photo) { create(:photo, gallery: gallery) }
    let!(:gallery_params) do
      {
        data: {
          attributes: {
            tag_id: tag.id,
            source_id: gallery.id,
            type: 'Gallery'
          }
        }
      }
    end

    let!(:photo_params) do
      {
        data: {
          attributes: {
            tag_id: tag.id,
            source_id: photo.id,
            type: 'Photo'
          }
        }
      }
    end

    it 'gallery successfully' do
      post "/v1/tags/#{tag.id}/make_tag", params: gallery_params

      expect(response).to have_http_status(:success)
    end

    it 'photo successfully' do
      post "/v1/tags/#{tag.id}/make_tag", params: photo_params

      expect(response).to have_http_status(:success)
    end

    it 'photo failure' do
      post '/v1/tags/-1/make_tag', params: photo_params

      expect(response).to have_http_status(:not_found)
    end
  end

  context 'when get photo by tag' do
    let!(:tag) { create(:tag) }
    let!(:gallery) { create(:gallery) }
    let!(:photo) { create(:photo, gallery: gallery) }
    let!(:tags_photo) { create(:tags_source, :photo, tag_id: tag.id, source_id: photo.id) }
    let!(:tags_gallery) { create(:tags_source, :gallery, tag_id: tag.id, source_id: photo.id) }
    it 'succesfully' do
      get "/v1/tags/#{tag.id}/photos"

      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)

      expect(body['data'].size).to eq(1)
      expect(body['data'].first['type']).to eq('photos')
    end
  end

  context 'when get photo by tag' do
    let!(:tag) { create(:tag) }
    let!(:gallery) { create(:gallery) }
    let!(:photo) { create(:photo, gallery: gallery) }
    let!(:tags_photo) { create(:tags_source, :photo, tag_id: tag.id, source_id: photo.id) }
    let!(:tags_gallery) { create(:tags_source, :gallery, tag_id: tag.id, source_id: photo.id) }
    it 'succesfully' do
      get "/v1/tags/#{tag.id}/galleries"

      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)

      expect(body['data'].size).to eq(1)
      expect(body['data'].first['type']).to eq('galleries')
    end
  end
end
