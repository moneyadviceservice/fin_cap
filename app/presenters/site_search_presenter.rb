class SiteSearchPresenter < BasePresenter
  PAGINATION_PREVIOUS_TEXT = '<'.freeze
  PAGINATION_NEXT_TEXT = '>'.freeze
  delegate :params, :index, to: :view

  def pagination_information
    view.strip_tags("Page #{object.page} of #{object.number_of_pages}")
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
        'pagination__prev-page',
        object.previous_page
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
        'pagination__next-page',
        object.next_page
      )
    end
  end

  private

  def first_page?
    current_page == 1
  end

  def last_page?
    current_page == total_pages
  end

  def current_page
    object.page
  end

  def total_pages
    object.number_of_pages
  end

  def show_pagination?
    total_pages.to_i > 1
  end

  def pagination_no_link(pagination_text, class_name)
    view.content_tag(
      :span,
      pagination_text,
      class: class_name + ' is-disabled'
    )
  end

  def pagination_link(pagination_text, class_name, page_number)
    view.link_to(
      pagination_text,
      view.search_results_path(
        query: params[:query],
        page: page_number
      ),
      class: class_name
    )
  end
end
