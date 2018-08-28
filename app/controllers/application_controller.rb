class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Mas::Cms::HttpRedirect, with: :redirect_page

  private

  def redirect_page(redirect)
    redirect_to redirect.location, status: redirect.http_response.status
  end
end
