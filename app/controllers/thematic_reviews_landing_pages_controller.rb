class ThematicReviewsLandingPagesController < FincapTemplatesController
  def resource
    Mas::Cms::Document.all(params: { document_type: ['thematic_reviews_landing_page'] })
  end
  helper_method :resource

  def index
    @landing_page = Mas::Cms::Document.all(params: { document_type: ['thematic_reviews_landing_page'] })
    @thematic_reviews = Mas::Cms::Document.all(params: { document_type: ['thematic_review'] })
    @thematic_reviews.map do |document|
    end
  end
end
