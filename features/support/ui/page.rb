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

  class CountryRow < SitePrism::Section
    element :link, 'a'
  end

  class ResearchRow < SitePrism::Section
    element :link, 'a'
  end

  class ResearchEvaluationBox < SitePrism::Section
    sections :research_rows, ResearchRow, 'li'
    element :title, 'h2'
  end

  class Page < SitePrism::Page
    sections :download_box,
             DownloadBoxSection, '.download-box ul.download-box__list li'
    sections :latest_news_item, LatestNewsItem, '.latest-news__list-item'
    sections :teaser_boxes, TeaserBox, '.teaser-box__content'
    sections :supplementary_info_box,
             SupplementaryInfoBox, '.sidepanel .l-2col-even'
    sections :lifestage_rows, LifestageRow, '.bordered-box--green li'
    sections :country_rows, CountryRow, '.list--countries-item'
    sections :research_and_evaluation_boxes, 
             ResearchEvaluationBox, '.coloured-box'

    element :title, '.l-2col-main h1'
    element :hero_description, '.hero__heading'
    element :country_list, 'ul.list--countries'

    def find_box(title)
      research_and_evaluation_boxes.find { |box| box.title.text == title }
    end
  end
end
