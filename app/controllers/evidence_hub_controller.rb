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
    { 
      locale: params[:locale] =~ /en|cy/ ? params[:locale] : 'en',
      document_type: DOCUMENT_TYPES 
    }.tap do |hash|
      hash[:keyword] = params.require(:keyword) if params[:keyword].present?
    end.merge(format_params)
  end

  def filter_params
    params.fetch(:evidence_hub_search_form, {}).permit(
      :years_of_publication,
      client_groups: [],
      topics: [],
      countries_of_delivery: []
    )
  end

  def format_params
    return {} unless params[:evidence_hub_search_form].present?

    format_filters(
      filter_params.to_h.reject {|_,v| empty_filter?(v) }
    )
  end

  def format_filters(filters)
    { blocks: blocks(filters).flatten }
  end

  def blocks(filters)
    filters.map do |id, values|
      if values.is_a?(Array)
        values.reject(&:blank?).map {|value| identifier_hash(id, value) }
      else
        identifier_hash(id, values)
      end
    end
  end

  def identifier_hash(id, value)
    { identifier: id, value: value }
  end

  def empty_filter?(value)
    empty_string?(value) || empty_array?(value)
  end

  def empty_string?(value)
    value.is_a?(String) && value.empty?
  end

  def empty_array?(value)
    value.is_a?(Array) && value.one? && value.first.empty?
  end
end
