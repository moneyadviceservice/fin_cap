class ThematicReviewsController < FincapTemplatesController
  def resource
    ThematicReviewTemplate.new(Mas::Cms::ThematicReview.find(params[:id]))
  end
  helper_method :resource

  def index
    @landing_page = Mas::Cms::Document.all(params: { document_type: ['thematic_reviews_landing_page'] })
    @thematic_reviews = Mas::Cms::Document.all(params: { document_type: ['thematic_review'] })
    @thematic_reviews.map do |document|
    end
  end
end
