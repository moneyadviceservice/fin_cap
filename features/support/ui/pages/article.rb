module UI
  module Pages
    class DownloadBoxSection < SitePrism::Section
      element :link, 'a'
    end

    class Article < UI::Page
      set_url '/en/articles/{/slug}'
      sections :download_box, DownloadBoxSection, '.download-box ul.download-box__list li'
    end
  end
end
