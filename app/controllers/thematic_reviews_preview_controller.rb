class ThematicReviewsPreviewController < ThematicReviewsController
  def resource
    ThematicReviewTemplate.new(
      Mas::Cms::ArticlePreview.find(params[:id], locale: params[:locale])
    )
  end
end
