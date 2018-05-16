class ReviewsController < EvidenceSummariesController
  def resource
    Mas::Cms::Review.find(params[:id])
  end
end
