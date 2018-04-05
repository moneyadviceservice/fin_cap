class SearchFormParamParser
  attr_accessor :params

  def self.parse(params)
    new(params).parse
  end

  def initialize(params)
    @params = params
  end

  def parse
    filter_params, non_filter_params = params.partition do |k,_|
      filter_keys.include?(k)
    end

    non_filter_params.to_h.merge(parse_filters(filter_params))
  end

  private

  def parse_filters(filters)
    { blocks: blocks_hash(filters).flatten }
  end

  def blocks_hash(filters)
    filters.map do |id, values|
      if values.is_a?(Array)
        values.map { |value| identifier_hash(id, value) }
      else
        identifier_hash(id, values)
      end
    end
  end

  def identifier_hash(id, value)
    { identifier: id, value: value }
  end

  def filter_keys
    EvidenceSummarySearchForm.checkbox_filters + 
      EvidenceSummarySearchForm.radio_button_filters
  end
end
