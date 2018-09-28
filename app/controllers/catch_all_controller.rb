class CatchAllController < ApplicationController
  def index
    Mas::Cms::Client.connection.get("/api/#{params[:path]}")

    not_found
  end
end
