class NewsController < FincapTemplatesController
  def resource
    NewsTemplate.new(Mas::Cms::News.find(params[:id]))
  end
  helper_method :resource
end
