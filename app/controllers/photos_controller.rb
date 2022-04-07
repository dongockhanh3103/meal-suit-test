# frozen_string_literal: true

class PhotosController < ApplicationController

  include ActsResource

  def sort_criteria
    %i[id shoot_date name created_at]
  end

  def search_by_name
    query = SearchByTermService.execute(params[:term], @resource_client)

    resources = query_with_parser(query)

    jsonapi_render json: resources, resource_class: @resource_class
  end

  private

  def includes_attributes
    []
  end

  def set_resource_client
    @resource_client ||= Photo
  end

  def set_resource_class
    @resource_class ||= PhotoResource
  end

  def filter_attributes
    %i[gallery_id name]
  end

  def permitted_create_params
    params.require(:data).require(:attributes).permit(
      :name,
      :short_description,
      :shoot_date,
      :source,
      :gallery_id
    ).to_h
  end

  def permitted_update_params
    params.require(:data).require(:attributes).permit(
      :name,
      :short_description,
      :shoot_date,
      :source,
      :gallery_id
    ).to_h
  end

end
