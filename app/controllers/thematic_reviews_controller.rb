class ThematicReviewsController < FincapTemplatesController
  def resource
    ThematicReviewTemplate.new(Mas::Cms::ThematicReview.find(params[:id]))
  end
  helper_method :resource
end
