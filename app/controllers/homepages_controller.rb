class HomepagesController < FincapTemplatesController
  HOMEPAGE_SLUG = 'root'.freeze

  def show
    @homepage = Mas::Cms::Homepage.find(HOMEPAGE_SLUG)

    @latest_news = TaggedNews.all(@homepage).map do |news|
      NewsTemplate.new(news)
    end
  end

  def resource
    HomepageTemplate.new(@homepage)
  end
  helper_method :resource
end
