class LifestagesController < FincapTemplatesController
  def resource
    LifestageTemplate.new(lifestage)
  end
  helper_method :resource

  def show
    @lifestage = Mas::Cms::Lifestage.find(params[:id])

    @latest_news = TaggedNews.all(lifestage).map do |news_item|
      NewsTemplate.new(news_item)
    end
  end

  private

  attr_accessor :lifestage
end
