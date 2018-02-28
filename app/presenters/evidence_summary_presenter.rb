class EvidenceSummaryPresenter < BasePresenter
  def link
    h.link_to title, full_path
  end

  def evidence_type_info
    h.t(
      'evidence_hub.search_results.evidence_type',
      evidence_type: evidence_type
    )
  end

  def stripped_overview
    h.strip_tags(overview)
  end

  def stripped_topics
    all_topics = topics.map { |topic| h.strip_tags(topic).strip }.join(', ')
    h.t('evidence_hub.search_results.topics', topics: all_topics)
  end

  def stripped_countries
    h.t(
      'evidence_hub.search_results.countries',
      countries: h.strip_tags(countries)
    )
  end

  def stripped_year_of_publication
    h.t(
      'evidence_hub.search_results.year_of_publication',
      year_of_publication: h.strip_tags(year_of_publication)
    )
  end
end
