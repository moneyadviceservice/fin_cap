class SearchFormParamParser
  FINCAP_START_YEAR = 2000
  IGNORED_OPTION = 'All years'.freeze
  YEAR_OF_PUBLICATION_FILTER = 'year_of_publication'.freeze

  attr_accessor :params

  def self.parse(params)
    new(params).parse
  end

  def initialize(params)
    @params = params
  end

  def parse
    filter_params, non_filter_params = params.to_h.partition do |k, _|
      filter_keys.include?(k)
    end

    non_filter_params.to_h.merge(parse_filters(filter_params))
  end

  private

  def parse_filters(filters)
    { blocks: blocks_hash(filters).flatten }
  end

  def blocks_hash(filters)
    query_filters(filters).map do |id, values|
      if year_of_publication?(id)
        identifier_hash(id, years_array(values))
      else
        values.map { |value| identifier_hash(id, value) }
      end
    end
  end

  def query_filters(filters)
    filters.reject { |_, v| v == IGNORED_OPTION }
  end

  def identifier_hash(id, value)
    { identifier: id, value: value }
  end

  def filter_keys
    EvidenceSummarySearchForm.checkbox_filters +
      EvidenceSummarySearchForm.radio_button_filters
  end

  def year_of_publication?(id)
    id == YEAR_OF_PUBLICATION_FILTER
  end

  def years_array(option)
    years_range[option].map do |n|
      n.year.ago.strftime('%Y').to_i
    end
  end

  def years_range
    {
      'Last 2 years' => (0..1),
      'Last 5 years' => (0..4),
      'More than 5 years ago' => (5..(Time.current.year - FINCAP_START_YEAR))
    }
  end
end
