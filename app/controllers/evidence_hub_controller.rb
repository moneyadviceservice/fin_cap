class EvidenceHubController < ApplicationController
  DOCUMENT_TYPES = ['Insight'].freeze

  def index
    documents = Mas::Cms::Document.all(
      params: search_params
    )
    @evidence_summaries = EvidenceSummary.map(documents)

    @search_form = EvidenceHubSearchForm.new(search_form_params)
  end

  private

  def search_form_params
    { 
      document_type: DOCUMENT_TYPES 
    }.tap do |hash|
      hash[:keyword] = params.require(:keyword) if params[:keyword].present?
    end.merge(filter_params)

  end

  def search_params
    search_form_params.merge(parse_filter_params)
  end

  def filter_params
    params.fetch(:evidence_hub_search_form, {}).permit(
      :years_of_publication,
      client_groups: [],
      topics: [],
      countries_of_delivery: []
    )
  end

  def parse_filter_params
    return {} unless params[:evidence_hub_search_form].present?
    FilterParser.parse(filter_params.to_h)
  end
end
