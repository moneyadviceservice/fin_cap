class EvidenceHubController < EvidenceSummariesController
  DOCUMENT_TYPES = %w[Insight Evaluation Review].freeze
  PAGINATION_DEFAULT_PAGE = 1
  PAGINATION_PER_PAGE = 20

  def index
    @search_form = EvidenceSummarySearchForm.new(form_params)
    @documents = Mas::Cms::Document.all(params: search_params)
    @evidence_summaries = EvidenceSummary.map(@documents)
  end

  def evidence_summary_search_form_params
    params.fetch(:evidence_summary_search_form, {}).permit(
      :keyword,
      :year_of_publication,
      client_groups: [],
      topics: [],
      countries_of_delivery: [],
      measured_outcomes: []
    )
  end
  helper_method :evidence_summary_search_form_params

  def thematic_review
    @thematic_review ||= Mas::Cms::ThematicReview.find(params[:tag])
  end
  helper_method :thematic_review

  private

  def form_params
    form_params = {
      document_type: DOCUMENT_TYPES,
      page: params[:page] || PAGINATION_DEFAULT_PAGE,
      per_page: params[:per_page] || PAGINATION_PER_PAGE
    }
    form_params[:tag] = params[:tag] if params[:tag].present?

    if clear_search?
      form_params.merge(reset_all_params)
    else
      form_params.merge(evidence_summary_search_form_params)
    end
  end

  def search_params
    SearchFormParamParser.parse(form_params)
  end

  def reset_all_params
    { keyword: '' }
  end

  def clear_search?
    params[:reset]
  end
end
