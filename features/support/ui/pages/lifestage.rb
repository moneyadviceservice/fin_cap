module UI
  module Pages
    class TeaserBox < SitePrism::Section
      element :title, '.teaser-box__title'
      element :image, '.teaser-box__image'
      element :content, '.teaser-box__content'
      element :link, '.teaser-box__cta'
    end

    class SupplementaryInfoBox < SitePrism::Section
      element :title, '.lifestage_info-box__title'
      element :content, '.lifestage_info-box__content'
      elements :links, 'a'
    end

    class Lifestage < ::UI::Pages::Article
      set_url '/en/lifestages/{/slug}'

      element :main_description, '.hero'
      element :latest_news, '.latest-news'
      sections :teaser_boxes, TeaserBox, '.teaser-box'
      sections :strategy_box, SupplementaryInfoBox, '.lifestage_info-box'
    end
  end
end
