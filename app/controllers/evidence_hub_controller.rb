class EvidenceHubController < ApplicationController
  DOCUMENT_TYPES = ['Insight'].freeze

  def index
    documents = Mas::Cms::Document.all(
      params: { document_type: DOCUMENT_TYPES }
    )
    @evidence_summaries = EvidenceSummary.map(documents)
  end
end
