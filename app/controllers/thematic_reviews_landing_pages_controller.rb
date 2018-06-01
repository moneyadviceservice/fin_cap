class ThematicReviewsLandingPagesController < FincapTemplatesController
  def resource
    Mas::Cms::Document.all(params: { document_type: ['thematic_reviews_landing_page'] })
  end
  helper_method :resource

  def show
    @thematic_reviews = Mas::Cms::Document.all(params: { document_type: ['thematic_review'] })
    @documents = @thematic_reviews.map{|document| ThematicReviewTemplate.new(document)}
  end
end
