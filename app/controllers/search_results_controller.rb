class SearchResultsController < ApplicationController
  def index
    return if params[:query].blank?

    @search_results = SiteSearch::Query.new(
      params[:query],
      options: {
        index: 'pages',
        highlightPreTag: '<b>',
        highlightPostTag: '</b>',
        page: params[:page],
        hitsPerPage: 10
      }
    ).results

    return render('index_with_results') if @search_results.any?

    render('index_no_results')
  end
end
