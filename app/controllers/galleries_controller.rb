# frozen_string_literal: true

class GalleriesController < ApplicationController

  include ActsResource

  def sort_criteria
    %i[id created_at name]
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
    @resource_client ||= Gallery
  end

  def set_resource_class
    @resource_class ||= GalleryResource
  end

  def filter_attributes
    [:name]
  end

  def permitted_create_params
    params.require(:data).require(:attributes).permit(
      :name,
      :short_description
    )
  end

  def permitted_update_params
    params.require(:data).require(:attributes).permit(
      :name,
      :short_description
    )
  end

end
