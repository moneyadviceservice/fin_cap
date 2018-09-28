class CatchAllController < ApplicationController
  rescue_from Mas::Cms::Errors::ResourceNotFound, with: :not_found
  rescue_from Mas::Cms::Errors::ClientError, with: :not_found

  def index
    Mas::Cms::Client.connection.get("/api/#{params[:path]}")

    not_found
  end

  private

  def not_found
    render 'errors/not_found', layout: 'errors'
  end
end
