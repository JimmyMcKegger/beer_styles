# frozen_string_literal: true

class GraphqlController < ApplicationController
  protect_from_forgery with: :null_session

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]

    api_client_session = ApiClientSession.where(key: request.headers['X-Beer-Authorization']).first
    Rails.logger.info "API Client Session ID: #{api_client_session&.id}"
    Rails.logger.info "Logged in as User ID: #{api_client_session&.user&.id}"

    context = {
      current_user: api_client_session&.user,
      api_client_session_id: api_client_session&.id,
      time: Time.now
    }
    result = BeersSchema.execute(query, variables:, context:, operation_name:)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
