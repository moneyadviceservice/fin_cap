class EvidenceHubController < ApplicationController
  DOCUMENT_TYPES = ['Insight'].freeze

  def index
    @search_form = EvidenceSummarySearchForm.new(search_params)
    documents = Mas::Cms::Document.all(params: parse_params)
    @evidence_summaries = EvidenceSummary.map(documents)
  end

  private

  def search_params
    {
      document_type: DOCUMENT_TYPES
    }.merge(evidence_summary_search_form_params)
  end

  def evidence_summary_search_form_params
    params.fetch(:evidence_summary_search_form, {}).permit(
      :keyword,
      :year_of_publication,
      client_groups: [],
      topics: [],
      countries_of_delivery: []
    )
  end

  def parse_params
    return {} if params[:evidence_summary_search_form].blank?

    SearchFormParamParser.parse(evidence_summary_search_form_params)
  end
end
