class NewsPreviewController < NewsController
  def resource
    NewsTemplate.new(
      Mas::Cms::ArticlePreview.find(params[:id], locale: params[:locale])
    )
  end
end
