module UI
  module Pages
    class TeaserBox < SitePrism::Section
      element :title, '.teaser-box__title'
      element :image, '.teaser-box__image'
      element :content, '.teaser-box__content'
      element :link, '.teaser-box__cta'
    end

    class StrategyBox < SitePrism::Section
      element :title, '.bordered-box__title'
      element :content, '.bordered-box__content'
      element :link, 'a'
    end

    class Lifestage < ::UI::Pages::Article
      set_url '/en/lifestages/{/slug}'

      element :main_description, '.hero'
      element :latest_news, '.latest-news'
      elements :steering_group_links, '.t-steering-group a'
      sections :teaser_boxes, TeaserBox, '.teaser-box'
      section :strategy_box, StrategyBox, '.t-strategy-box'
    end
  end
end
