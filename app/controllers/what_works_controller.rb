class WhatWorksController < FincapTemplatesController
  def resource
    WhatWorksTemplate.new(what_works)
  end
  helper_method :resource

  def show
    @what_works = Mas::Cms::WhatWorks.find(params[:id])

    @latest_news = TaggedNews.all(what_works).map do |news_item|
      NewsTemplate.new(news_item)
    end
  end

  private

  attr_accessor :what_works
end
