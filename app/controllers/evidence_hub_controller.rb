class EvidenceHubController < ApplicationController
  DOCUMENT_TYPES = ['Insight'].freeze

  def index
    @search_form = EvidenceSummarySearchForm.new(search_form_params)

    documents = Mas::Cms::Document.all(
      params: parse_filter_params
    )
    @evidence_summaries = EvidenceSummary.map(documents)
  end

  private

  def search_form_params
    {
      document_type: DOCUMENT_TYPES
    }.merge(evidence_summary_search_form_params)
  end

  def evidence_summary_search_form_params
    params.fetch(:evidence_summary_search_form, {}).permit(
      :keyword,
      :years_of_publication,
      client_groups: [],
      topics: [],
      countries_of_delivery: []
    )
  end

  def filter_params
    evidence_summary_search_form_params.select do |k, _|
      filter_keys.include?(k)
    end
  end

  def parse_filter_params
    return {} if params[:evidence_summary_search_form].blank?
    FilterParser.parse(filter_params.to_h)
  end

  def filter_keys
    @search_form.checkbox_filters + @search_form.radio_button_filters
  end
end
