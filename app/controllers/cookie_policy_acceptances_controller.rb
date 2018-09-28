class CookiePolicyAcceptancesController < ApplicationController
  def create
    cookies.permanent[COOKIE_POLICY_MESSAGE_NAME] = COOKIE_POLICY_MESSAGE_VALUE

    respond_to do |format|
      format.html do
        redirect_back(fallback_location: root_path)
      end
    end
  end
end
