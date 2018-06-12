class ArticlesPreviewController < ArticlesController
  def resource
    ArticleTemplate.new(
      Mas::Cms::ArticlePreview.find(params[:id], locale: params[:locale])
    )
  end
end
