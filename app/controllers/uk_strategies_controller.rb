class UkStrategiesController < FincapTemplatesController
  def show
    @uk_strategy = Mas::Cms::UkStrategy.find(params[:id])

    @latest_news = TaggedNews.all(@uk_strategy).map do |news|
      NewsTemplate.new(news)
    end
  end

  def resource
    UkStrategyTemplate.new(@uk_strategy)
  end
  helper_method :resource
end
