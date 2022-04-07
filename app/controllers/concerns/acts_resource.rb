# frozen_string_literal: true

module ActsResource

  extend ActiveSupport::Concern
  SIZE_DEFAULT = 10
  PAGE_NUMBER_DEFAULT = 1

  included do
    before_action :set_resource_client, :set_resource_class
  end

  def index
    get_resources!

    jsonapi_render json: @resources, resource_class: @resource_class
  end

  def show
    get_resource!

    jsonapi_render json: @resource, resource_class: @resource_class
  end

  def destroy
    get_resource!

    @resource.destroy!

    jsonapi_render json: @resource, resource_class: @resource_class
  end

  def create
    resource = @resource_client.new(permitted_create_params)
    resource.save

    if resource.errors.any?
      render_jsonapi_error resource
    else
      jsonapi_render json: resource, resource_class: @resource_class
    end
  end

  def update
    get_resource!
    @resource.update(permitted_update_params)

    if @resource.errors.any?
      render_jsonapi_error @resource
    else
      jsonapi_render json: @resource, resource_class: @resource_class
    end
  end

  def query_with_parser(base_query = @resource_client)
    filters = parse_params.fetch(:filters)
    paginator = parse_params.fetch(:paginator)
    sort_criterias = parse_params.fetch(:sort_criterias)
    query_builder = base_query
    query_builder = query_builder.includes(includes_attributes) if includes_attributes.present?
    query_builder = query_builder.where(filters) if filters.present?
    query_builder = query_builder.order(sort_criterias) if sort_criterias.present?

    if paginator.present?
      query_builder = query_builder.offset(paginator.offset).limit(paginator.limit)
    end

    query_builder.all
  end

  private

  def get_resource!
    if includes_attributes.present?
      @resource_client = @resource_client.includes(includes_attributes)
    end
    @resource ||= @resource_client.find(params[:id])
  end

  def get_resources!
    @resources ||= query_with_parser
  end

  def parse_params
    @parse_params ||= {
      filters:        parse_filters_params,
      paginator:      parse_paginator_params,
      sort_criterias: parse_sorts_params
    }
  end

  def parse_paginator_params
    paginator = jsonapi_get_params[:page] || { }

    limit = paginator[:size] || SIZE_DEFAULT
    page = paginator[:number] || PAGE_NUMBER_DEFAULT

    OpenStruct.new(
      {
        offset: (page.to_i - 1) * limit.to_i,
        limit:  limit.to_i
      }
    )
  end

  def parse_sorts_params
    fields = jsonapi_get_params[:sort].try(:split, ',') || []
    convert_to_ordered_hash(fields)
  end

  def parse_filters_params
    result = { }

    jsonapi_get_params[:filter].to_h.each do |key, value|
      result[key] = value
    end

    result
  end

  def jsonapi_get_params
    @jsonapi_get_params ||= params.except(:format).permit(
      :sort,
      filter: filter_attributes,
      page:   %i[
        size
        number
      ]
    )
  end

  def filter_attributes
    []
  end

  def sort_criteria
    [:id]
  end

  def includes_attributes
    nil
  end

  def set_resource_client
    # rubocop:disable Style/ImplicitRuntimeError
    raise 'Method not implemented'
  end

  def set_resource_class
    raise 'Method not implemented'
  end

  def permitted_create_params
    raise 'Method not implemented'
  end

  def permitted_update_params
    raise 'Method not implemented'
    # rubocop:enable Style/ImplicitRuntimeError
  end

  def convert_to_ordered_hash(fields)
    fields.each_with_object({ }) do |field, hash|
      direction = :asc
      if field.start_with?('-')
        field = field[1..].to_sym
        direction = :desc
      end
      hash[field] = direction if sort_criteria.include?(field.to_sym)
    end
  end

end
