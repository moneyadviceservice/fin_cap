class EvidenceSummariesPresenter < BasePresenter
  PAGINATION_PREVIOUS_TEXT = '<'.freeze
  PAGINATION_NEXT_TEXT = '>'.freeze
  delegate :params, :evidence_summary_search_form_params, to: :view

  def thematic_review_message
    return unless params[:tag].present? && collection.present?

    view.render 'thematic_review_message'
  end

  def total_results_description
    view.t(
      'fincap.evidence_hub.pagination.total_results',
      total_results: meta['results']
    )
  end

  def pagination_description
    view.t(
      'fincap.evidence_hub.pagination.pagination_description',
      current_page: current_page,
      total_pages: total_pages
    )
  end

  def previous_page
    if first_page?
      PAGINATION_PREVIOUS_TEXT
    else
      view.link_to(
        PAGINATION_PREVIOUS_TEXT,
        view.evidence_hub_index_path(
          params.permit!.merge(page: previous_page_number)
        ),
        class: 'evidence-hub__previous-page'
      )
    end
  end

  def next_page
    if last_page?
      PAGINATION_NEXT_TEXT
    else
      view.link_to(
        PAGINATION_NEXT_TEXT,
        view.evidence_hub_index_path(
          params.permit!.merge(page: next_page_number)
        ),
        class: 'evidence-hub__next-page'
      )
    end
  end

  def first_page?
    current_page == 1
  end

  def last_page?
    current_page == total_pages
  end

  private

  def current_page
    meta['page']
  end

  def total_pages
    meta['total_pages']
  end

  def previous_page_number
    current_page - 1
  end

  def next_page_number
    current_page + 1
  end
end
