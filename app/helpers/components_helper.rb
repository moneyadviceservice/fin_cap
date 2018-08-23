module ComponentsHelper
  UK_REGION = 'uk'.freeze

  def strategy_path(country)
    if region_uk?(country[:region])
      uk_strategy_path(id: country[:slug], locale: 'en')
    else
      regional_strategy_path(id: country[:slug], locale: 'en')
    end
  end

  private

  def region_uk?(region)
    region == UK_REGION
  end
end
