class ApplicationController < ActionController::API
  include Pagy::Backend

  if Rails.env.production?
    rescue_from ::NameError, with: :error_occurred
    rescue_from ::ActionController::RoutingError, with: :error_occurred
  end

  protected

  # renders json success data in the default format
  # @return nil
  # @param [Hash] data (null) response body data
  # @param [Hash] metadata data about data
  def render_json(data, metadata = {})
    render json: {
      metadata: metadata,
      errors: [],
      data: data
    }, status: :ok
  end

  # renders json success data in the default format
  # @return nil
  # @param [Symbol] status (null) response HTTP status
  # @param [Array<Hash>] errors an array of errors
  def render_json_error(status = :bad_request, errors = [])
    render json: {
      metadata: {},
      errors: errors,
      data: nil
    }, status: status
  end

  # renders 404 status with default message
  def record_not_found(_exception = nil)
    render_json_error(:not_found, ['record not found'])
  end

  # renders 5XX status with default message
  def error_occurred(_exception = nil)
    render_json_error(:internal_server_error, ['an internal server error occurred'])
  end
end
