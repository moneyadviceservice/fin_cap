module UI
  module Pages
    class CallToActionBoxSection < SitePrism::Section
      element :link, 'a'
    end

    class Article < UI::Page
      set_url '/en/articles/{/slug}'

      element :feedback_box, '.feedback-box'
      sections :call_to_action_box,
               CallToActionBoxSection,
               '.list--grouped-cta li'
    end
  end
end
