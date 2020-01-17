class ApplicationController < ActionController::Base
  include CookiePolicyAcceptance
  protect_from_forgery with: :exception
  rescue_from Mas::Cms::HttpRedirect, with: :redirect_page
  rescue_from Mas::Cms::Errors::ResourceNotFound, with: :not_found
  rescue_from Mas::Cms::Errors::ClientError, with: :not_found
  rescue_from Mas::Cms::Errors::ConnectionFailed, with: :service_unavailable

  protected

  def not_found
    redirect_to not_found_path
  end

  def show_home_banner?
    false
  end

  helper_method :show_home_banner?

  private

  def service_unavailable
    redirect_to service_unavailable_path
  end

  def redirect_page(redirect)
    redirect_to redirect.location, status: redirect.http_response.status
  end
end
