class ThematicReviewsController < FincapTemplatesController
  LANDING_PAGE_DOCUMENT_TYPE = 'thematic_reviews_landing_page'.freeze
  THEMATIC_REVIEWS_DOCUMENT_TYPE = 'thematic_review'.freeze

  def index
    document = Mas::Cms::ThematicReviewsLandingPage.all(
      params: {
        document_type: [LANDING_PAGE_DOCUMENT_TYPE],
        page: 1,
        per_page: 20
      }
    ).first
    @index_page = ThematicReviewsLandingPageTemplate.new(document)
  end

  def resource
    ThematicReviewTemplate.new(Mas::Cms::ThematicReview.find(params[:id]))
  end
  helper_method :resource

  def resource_collection
    documents = Mas::Cms::ThematicReview.all(
      params: {
        document_type: [THEMATIC_REVIEWS_DOCUMENT_TYPE],
        page: 1,
        per_page: 20
      }
    )

    documents.map { |document| ThematicReviewTemplate.new(document) }
  end
  helper_method :resource_collection
end
