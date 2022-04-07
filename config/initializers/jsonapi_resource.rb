# frozen_string_literal: true

JSONAPI.configure do |config|
  # https://jsonapi-resources.com/v0.10/guide/configuration.html
  config.json_key_format = :underscored_key
  config.route_format = :underscored_route
  config.default_paginator = :paged
  config.default_page_size = 20
  config.maximum_page_size = 500

  config.allow_include = true
  config.allow_sort = true
  config.allow_filter = true

  config.raise_if_parameters_not_allowed = false

  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count

  config.top_level_meta_include_page_count = true
  config.top_level_meta_page_count_key = :page_count
end