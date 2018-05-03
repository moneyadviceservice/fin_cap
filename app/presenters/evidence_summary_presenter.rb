class EvidenceSummaryPresenter < BasePresenter
  def link
    view.link_to title, full_path
  end

  def evidence_type_field_name
    translate_field(:evidence_type)
  end

  def topics_field_name
    translate_field(:topics)
  end

  def countries_field_name
    translate_field(:countries)
  end

  def year_of_publication_field_name
    translate_field(:year_of_publication)
  end

  def client_group_field_name
    translate_field(:client_group)
  end

  def formatted_evidence_type_label
    "#{evidence_type_field_name}:"
  end

  def contact_information_field_name
    translate_field(:contact_information)
  end

  def links_to_research_field_name
    translate_field(:links_to_research)
  end

  def formatted_topics
    "#{topics_field_name}: #{stripped_topics.join(', ')}"
  end

  def formatted_countries
    "#{countries_field_name}: #{stripped_countries}"
  end

  def formatted_year_of_publication
    "#{year_of_publication_field_name}: #{stripped_year_of_publication}"
  end

  def data_type_keys
    view.t('fincap.evidence_hub.insight_summary.data_types')
  end

  def data_type_icon(type)
    stripped_data_types.include?(type) ? 'tick' : 'cross'
  end

  def stripped_data_types
    strip_collection(data_types)
  end

  def stripped_overview
    strip_text(overview)
  end

  def stripped_client_group
    strip_collection(client_group)
  end

  def stripped_topics
    strip_collection(topics)
  end

  def stripped_year_of_publication
    strip_text(year_of_publication)
  end

  def stripped_countries
    strip_text(countries)
  end

  private

  def translate_field(field)
    object.class.human_attribute_name(field)
  end

  def strip_collection(collection)
    collection.map { |element| strip_text(element).strip }
  end

  def strip_text(text)
    view.strip_tags(text)
  end
end
