module UI
  module Pages
    class DownloadBoxSection < SitePrism::Section
      element :link, 'a'
    end

    class CallToActionBoxSection < SitePrism::Section
      element :link, 'a'
    end

    class Article < UI::Page
      set_url '/en/articles/{/slug}'

      element :main_description, '.hero'
      element :feedback_box, '.feedback-box'
      sections :download_box,
               DownloadBoxSection,
               '.download-box ul.download-box__list li'
      sections :call_to_action_box,
               CallToActionBoxSection,
               '.list--grouped-cta li'
    end
  end
end
