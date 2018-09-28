module CookiePolicyAcceptance
  extend ActiveSupport::Concern
  include AbstractController::Helpers::ClassMethods

  COOKIE_POLICY_MESSAGE_NAME = '_cookie_policy_acceptance'.freeze
  COOKIE_POLICY_MESSAGE_VALUE = 'y'.freeze

  included do
    def cookie_policy_accepted?
      cookies.permanent[COOKIE_POLICY_MESSAGE_NAME] ==
        COOKIE_POLICY_MESSAGE_VALUE
    end
    helper_method :cookie_policy_accepted?
  end
end
