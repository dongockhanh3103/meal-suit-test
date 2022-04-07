class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token
  rescue_from StandardError, with: :handle_exception

  include JsonApiRenderer

  def handle_exception(exception = nil)
    if exception
      if [ActionController::RoutingError, ActiveRecord::RecordNotFound].include?(exception.class)
        render_not_found
      else
        render_internal_error
      end
    end
  end

  private

  def render_not_found
    render_error(code: :record_not_found, status_code: :not_found)
  end

  def render_internal_error
    render_error(code: :internal_server_error, status_code: :internal_server_error)
  end

  def render_error(code:, status_code:)
    render json: {
      errors: {
        title:  code,
        detail: code,
        code:   code,
        source: {
          pointer: "#{controller_path}/#{action_name}"
        },
      }
    }, status: status_code
  end

end
