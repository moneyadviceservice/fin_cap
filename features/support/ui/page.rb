require 'site_prism'

module UI
  class LatestNewsItem < SitePrism::Section
    element :title, '.latest-news__list-item__text'
    element :date, '.latest-news__list-item__date'
    element :link, '.latest-news__list-item__cta'
  end

  class DownloadBoxSection < SitePrism::Section
    element :link, 'a'
  end

  class SupplementaryInfoBox < SitePrism::Section
    element :title, 'h2'
    element :content, 'p'
    elements :links, 'a'
  end

  class TeaserBox < SitePrism::Section
    element :title, '.teaser-box__title'
    element :image, '.teaser-box__image'
    element :content, '.teaser-box__content-text'
    element :link, '.teaser-box__cta'
  end

  class LifestageRow < SitePrism::Section
    element :link, 'a'
  end

  class Page < SitePrism::Page
    sections :download_box,
             DownloadBoxSection, '.download-box ul.download-box__list li'
    sections :latest_news_item, LatestNewsItem, '.latest-news__list-item'
    sections :teaser_boxes, TeaserBox, '.teaser-box__content'
    sections :supplementary_info_box,
             SupplementaryInfoBox, '.sidepanel .l-2col-even'
    sections :lifestage_rows, LifestageRow, '.bordered-box--green li'
    element :title, '.l-2col-main h1'
    element :hero_description, '.hero__heading'
  end
end
