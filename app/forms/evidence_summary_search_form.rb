class EvidenceSummarySearchForm
  include ActiveModel::Model

  attr_accessor :keyword,
                :document_type,
                :evidence_types,
                :client_groups,
                :countries_of_delivery,
                :topics,
                :year_of_publication,
                :page,
                :per_page,
                :tag,
                :measured_outcomes

  CHECKBOX_FILTERS = %w[client_groups topics countries_of_delivery].freeze
  RADIO_BUTTON_FILTERS = %w[year_of_publication].freeze

  def self.checkbox_filters
    CHECKBOX_FILTERS
  end

  def self.radio_button_filters
    RADIO_BUTTON_FILTERS
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
