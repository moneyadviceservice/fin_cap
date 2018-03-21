class EvidenceHubController < ApplicationController

  DOCUMENT_TYPES = ['Insight'].freeze

  def index
    documents = Mas::Cms::Document.all(
      params: search_params
    )
    @evidence_summaries = EvidenceSummary.map(documents)
    @search_form = EvidenceHubSearchForm.new
  end

  private

  def search_params
    binding.pry
    { document_type: DOCUMENT_TYPES }.tap do |hash|
      hash[:keyword] = params.require(:keyword) if params[:keyword].present?
    end
  end
end
