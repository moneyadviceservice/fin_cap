class EvidenceSummaryPresenter < BasePresenter
  def link
    view.link_to title, full_path
  end

  def evidence_type_info
    view.t(
      'evidence_hub.search_results.evidence_type',
      evidence_type: evidence_type
    )
  end

  def stripped_overview
    view.strip_tags(overview)
  end

  def stripped_topics
    all_topics = topics.map { |topic| view.strip_tags(topic).strip }.join(', ')
    view.t('evidence_hub.search_results.topics', topics: all_topics)
  end

  def stripped_countries
    view.t(
      'evidence_hub.search_results.countries',
      countries: view.strip_tags(countries)
    )
  end

  def stripped_year_of_publication
    view.t(
      'evidence_hub.search_results.year_of_publication',
      year_of_publication: view.strip_tags(year_of_publication)
    )
  end
end
