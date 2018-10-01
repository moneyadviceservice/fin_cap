class ErrorsController < ApplicationController
  layout 'errors'

  def not_found
    render 'not_found', status: :not_found
  end

  def service_unavailable
    render 'service_unavailable', status: :service_unavailable
  end
end
