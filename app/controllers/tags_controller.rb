# frozen_string_literal: true

class TagsController < ApplicationController

  include ActsResource

  before_action :find_tag, only: [:make_tag]

  def make_tag
    klass = "Tags#{permitted_tag_resource_params[:type]}".classify.constantize
    resource = klass.new(
      source_id: permitted_tag_resource_params[:source_id],
      tag_id:    @tag.id
    ).save

    render json: { success: resource }
  end

  def photos
    photo_ids = TagsPhoto.where(tag_id: params[:id]).pluck(:source_id)

    query = Photo.where(id: photo_ids)

    resources = query_with_parser(query)

    jsonapi_render json: resources, resource_class: PhotoResource
  end

  def galleries
    gallery_ids = TagsGallery.where(tag_id: params[:id]).pluck(:source_id)

    query = Gallery.where(id: gallery_ids)

    resources = query_with_parser(query)

    jsonapi_render json: resources, resource_class: GalleryResource
  end

  private

  def includes_attributes
    []
  end

  def set_resource_client
    @resource_client ||= Tag
  end

  def set_resource_class
    @resource_class ||= TagResource
  end

  def filter_attributes
    [:label]
  end

  def permitted_create_params
    params.require(:data).require(:attributes).permit(
      :label
    ).to_h
  end

  def permitted_tag_resource_params
    params.require(:data).require(:attributes).permit(
      :source_id,
      :type
    ).to_h
  end

  def find_tag
    @tag ||= @resource_client.find(params[:id])
  end

end
