class ThematicReviewsLandingPagesController < FincapTemplatesController
  LANDING_PAGE_DOCUMENT_TYPE = 'thematic_reviews_landing_page'.freeze
  THEMATIC_REVIEWS_DOCUMENT_TYPE = 'thematic_review'.freeze

  def resource
    get_documents(LANDING_PAGE_DOCUMENT_TYPE)
  end
  helper_method :resource

  def show
    @thematic_reviews = get_documents(THEMATIC_REVIEWS_DOCUMENT_TYPE)
  end

  private

  def get_documents(document_type)
    documents = Mas::Cms::Document.all(
      params: { document_type: [document_type] }
    )

    documents.map { |document| Document.new(document) }
  end
end
