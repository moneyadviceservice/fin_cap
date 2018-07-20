module UI
  module Pages
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

      elements :main_content, '.l-2col-main p'
      sections :teaser_boxes, TeaserBox, '.teaser-box'
      sections :supplementary_info_box,
               SupplementaryInfoBox, '.sidepanel .l-2col-even'
    end
  end
end
