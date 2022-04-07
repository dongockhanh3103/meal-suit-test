# frozen_string_literal: true

class CommentsController < ApplicationController

  include ActsResource

  private

  def includes_attributes
    []
  end

  def set_resource_client
    @resource_client ||= Comment
  end

  def set_resource_class
    @resource_class ||= CommentResource
  end

  def filter_attributes
    [:photo_id]
  end

  def permitted_create_params
    params.require(:data).require(:attributes).permit(
      :user_name,
      :content,
      :photo_id
    )
  end

end
