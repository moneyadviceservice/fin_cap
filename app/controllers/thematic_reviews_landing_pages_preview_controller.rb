class ThematicReviewsLandingPagesPreviewController < FincapTemplatesController
  def resource
    ArticleTemplate.new(
      Mas::Cms::ArticlePreview.find(params[:id], locale: params[:locale])
    )
  end
  helper_method :resource
end
