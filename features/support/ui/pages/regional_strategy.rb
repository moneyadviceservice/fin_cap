module UI
  module Pages
    class TeaserBox < SitePrism::Section
      element :title, '.teaser-box__title'
      element :image, '.teaser-box__image'
      element :content, '.teaser-box__content'
      element :link, '.teaser-box__cta'
    end

    class ForumBox < SitePrism::Section
      element :title, 'h2'
      element :content, 'p'
      elements :links, 'a'
    end

    class Countries < SitePrism::Section
      element :title, 'h2'
      element :content, 'p'
      elements :links, 'a'
    end

    class RegionalStrategy < ::UI::Pages::Article
      set_url '/en/regional_strategies/{/slug}'

      element :main_description, '.hero'
      element :latest_news, '.latest-news'
      sections :teaser_boxes, TeaserBox, '.teaser-box'
      section :supplementary_info_box,
               ForumBox, '.sidepanel .l-2col-even'
      sections :countries, Countries, '.list--countries--item'
    end
  end
end
