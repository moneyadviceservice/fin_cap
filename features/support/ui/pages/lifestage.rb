module UI
  module Pages
    class LatestNewsItem < SitePrism::Section
      element :title, '.latest-news__list-item__text'
      element :date, '.latest-news__list-item__date'
      element :link, '.latest-news__list-item__cta'
    end

    class TeaserBox < SitePrism::Section
      element :title, '.teaser-box__title'
      element :image, '.teaser-box__image'
      element :content, '.teaser-box__content'
      element :link, '.teaser-box__cta'
    end

    class SupplementaryInfoBox < SitePrism::Section
      element :title, 'h2'
      element :content, 'p'
      elements :links, 'a'
    end

    class Lifestage < ::UI::Pages::Article
      set_url '/en/lifestages/{/slug}'

      element :main_description, '.hero'
      elements :main_content, '.l-2col-main p'
      sections :latest_news_item, LatestNewsItem, '.latest-news__list-item'
      sections :teaser_boxes, TeaserBox, '.teaser-box'
      sections :supplementary_info_box,
               SupplementaryInfoBox, '.sidepanel .l-2col-even'
    end
  end
end
