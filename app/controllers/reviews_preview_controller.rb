class ReviewsPreviewController < ReviewsController
  def resource
    Mas::Cms::EvidenceSummaryPreview.find(params[:id], locale: params[:locale])
  end
end
