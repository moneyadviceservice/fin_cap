module UI
  module Pages
    class News < ::UI::Pages::Article
      set_url '/en/news/{/slug}'

      element :order_by_date, '.l-2col-main .news-date'
      element :cta_link, '.list--grouped-cta a'
    end
  end
end
