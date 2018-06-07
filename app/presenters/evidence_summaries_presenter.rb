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
    return nil unless show_pagination?

    view.t(
      'fincap.evidence_hub.pagination.pagination_description',
      current_page: current_page,
      total_pages: total_pages
    )
  end

  def previous_page
    return nil unless show_pagination?

    if first_page?
      pagination_no_link(
        PAGINATION_PREVIOUS_TEXT,
        'pagination__prev-page'
      )
    else
      pagination_link(
        PAGINATION_PREVIOUS_TEXT,
        'pagination__prev-page evidence-hub__previous-page',
        previous_page_number
      )
    end
  end

  def next_page
    return nil unless show_pagination?

    if last_page?
      pagination_no_link(
        PAGINATION_NEXT_TEXT,
        'pagination__next-page'
      )
    else
      pagination_link(
        PAGINATION_NEXT_TEXT,
        'pagination__next-page evidence-hub__next-page',
        next_page_number
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

  def show_pagination?
    total_pages.to_i > 1
  end

  def pagination_no_link(pagination_text, class_name)
    view.content_tag(
      :span,
      pagination_text,
      class: class_name + ' disabled'
    )
  end

  def pagination_link(pagination_text, class_name, page_number)
    view.link_to(
      pagination_text,
      view.evidence_hub_index_path(
        params.permit!.merge(page: page_number)
      ),
      class: class_name
    )
  end
end
