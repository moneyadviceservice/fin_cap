class SiteSearchPresenter < BasePresenter
  def pagination_information
    view.strip_tags("Page #{object.page} of #{object.number_of_pages}")
  end
end
