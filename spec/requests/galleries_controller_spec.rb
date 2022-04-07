# frozen_string_literal: true

require 'rails_helper'

describe GalleriesController.name, type: :request do
  let!(:data) { create_list(:gallery, 5) }
  let!(:create_params) do
    {
      data: {
        attributes: {
          name:              Faker::Name.unique.name,
          short_description: 'Sample Short Description'
        }
      }
    }
  end

  include_examples 'acts examples', Gallery

  context 'when create gallery' do
    let!(:params) do
      {
        data: {
          attributes: {
            short_description: 'Sample Short Description'
          }
        }
      }
    end

    it 'return error with invalid params' do
      post '/v1/galleries', params: params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
