class NewsController < FincapTemplatesController
  LATEST_NEWS_DOCUMENT_TYPE = 'latest_news'.freeze
  NEWS_DOCUMENT_TYPE = 'news'.freeze
  
  def resource
    NewsTemplate.new(Mas::Cms::News.find(params[:id]))
  end
  helper_method :resource
  
  def index
    document = Mas::Cms::LatestNews.all(
      params: { document_type: [LATEST_NEWS_DOCUMENT_TYPE] }
    ).first
    @index_page = LatestNewsTemplate.new(document)
  end

  def resource_collection
    documents = Mas::Cms::News.all(
      params: { document_type: [NEWS_DOCUMENT_TYPE] }
    )

    documents.map { |document| NewsTemplate.new(document) }
  end
  helper_method :resource_collection
end
