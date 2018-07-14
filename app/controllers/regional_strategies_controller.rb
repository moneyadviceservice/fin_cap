class RegionalStrategiesController < FincapTemplatesController
  def show
    @regional_strategy = Mas::Cms::RegionalStrategy.find(params[:id])

    @latest_news = TaggedNews.all(@regional_strategy).map do |news|
      NewsTemplate.new(news)
    end
  end

  def resource
    RegionalStrategyTemplate.new(@regional_strategy)
  end
  helper_method :resource

end
