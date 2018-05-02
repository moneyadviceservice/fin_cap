class EvidenceHubController < ApplicationController
  rescue_from Mas::Cms::Errors::ClientError, with: :render_bad_request

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
    }.merge(form_params)
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

  def form_params
    clear_search? ? reset_all_params : evidence_summary_search_form_params
  end

  def parse_params
    return reset_all_params if clear_search?

    if params[:evidence_summary_search_form].blank?
      {}
    else
      SearchFormParamParser.parse(evidence_summary_search_form_params)
    end
  end

  def reset_all_params
    { keyword: '' }
  end

  def clear_search?
    params[:reset]
  end

  def render_bad_request(e)
    Rails.logger.warn(e)

    @error = { status: 400, message: 'Bad request'}
    render :index
  end
end
