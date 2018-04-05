class EvidenceSummarySearchForm
  include ActiveModel::Model

  attr_accessor :keyword, :document_type, :evidence_types, :client_groups
  attr_accessor :countries_of_delivery, :topics, :years_of_publication

  def self.checkbox_filters
    I18n.t('evidence_hub.filters.checkbox')
  end

  def self.radio_button_filters
    I18n.t('evidence_hub.filters.radio_button')
  end

  def chosen_options?(option, field)
    Array(send(field)).include?(option)
  end

  def class_name
    self.class.name.underscore
  end

  def filter_title(filter)
    filter.split('_').map(&:singularize).join(' ').capitalize
  end
end
