require_relative '../page'

module UI
  module Pages
    class Article < UI::Page
      set_url '/en/articles/{/slug}'

      element :feedback_box, '.feedback-box'
      sections :call_to_action_box, '.list--grouped-cta li' do
        element :link, 'a'
      end
    end
  end
end
