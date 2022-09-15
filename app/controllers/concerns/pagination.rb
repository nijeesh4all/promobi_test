module Pagination
  extend ActiveSupport::Concern

  included do
    before_action :validate_pagination_param
  end

  # checks the :page param and handles the edge cases if any
  # @return nil
  def validate_pagination_param
    params[:page] = 1 unless params.key?(:page)

    render json: { error: 'invalid page' } unless params[:page].to_i.positive?
  end
end

