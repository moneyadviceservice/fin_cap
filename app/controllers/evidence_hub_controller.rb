class EvidenceHubController < EvidenceSummariesController
  DOCUMENT_TYPES = %w[Insight Evaluation].freeze

  def index
    @search_form = EvidenceSummarySearchForm.new(form_params)
    documents = Mas::Cms::Document.all(params: search_params)
    @evidence_summaries = EvidenceSummary.map(documents)
  end

  private

  def form_params
    form_params = {
      document_type: DOCUMENT_TYPES
    }

    if clear_search?
      form_params.merge(reset_all_params)
    else
      form_params.merge(evidence_summary_search_form_params)
    end
  end

  def search_params
    SearchFormParamParser.parse(form_params)
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

  def reset_all_params
    { keyword: '' }
  end

  def clear_search?
    params[:reset]
  end
end
