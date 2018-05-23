class ArticlesController < FincapTemplatesController
  def resource
    ArticleTemplate.new(Mas::Cms::Article.find(params[:id]))
  end
  helper_method :resource
end
