class CatchAllController < ApplicationController
  rescue_from Mas::Cms::Errors::ResourceNotFound, with: :not_found
  rescue_from Mas::Cms::Errors::ClientError, with: :not_found

  def index
    Mas::Cms::Client.connection.get("/api/#{params[:path]}")

    not_found
  end

  private

  def not_found
    raise ActionController::RoutingError.new(
      "No route matches #{params[:path]}"
    )
  end
end
