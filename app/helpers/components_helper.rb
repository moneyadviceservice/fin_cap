module ComponentsHelper
  UK_REGION = 'uk'.freeze
  STATIC_PAGE_TYPE = 'static'.freeze

  def strategy_path(country)
    if region_uk?(country[:region])
      uk_strategy_path(id: country[:slug], locale: 'en')
    else
      regional_strategy_path(id: country[:slug], locale: 'en')
    end
  end

  def define_path(page)
    return send(to_path(page[:slug]), locale: 'en') if static_page?(page)

    article_path(id: page[:slug], locale: 'en')
  end

  private

  def region_uk?(region)
    region == UK_REGION
  end

  def static_page?(page)
    page[:page_type] == STATIC_PAGE_TYPE
  end

  def to_path(slug)
    "#{slug.underscore}_path"
  end
end
