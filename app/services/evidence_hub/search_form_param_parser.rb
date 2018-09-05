class EvidenceHub::SearchFormParamParser
  KEY_INFO_FILTER = 'measured_outcomes'.freeze
  MULTI_OPTION_FILTERS = EvidenceSummarySearchForm.checkbox_filters

  attr_accessor :params

  def self.parse(params)
    new(params).parse
  end

  def initialize(params)
    @params = params
  end

  def parse
    filter_params, additional_params = params.to_h.partition do |k, _|
      filter_keys.include?(k)
    end

    if key_info_filters(additional_params.to_h)
      convert_key_info_filters(key_info_filters(additional_params.to_h))
    else
      additional_params.to_h.merge(parse_filters(filter_params))
    end
  end

  private

  def parse_filters(filters)
    blocks = blocks_hash(filters).flatten

    return {} if blocks.blank?

    { blocks: blocks }
  end

  def blocks_hash(filters)
    filters.map do |key, values|
      if MULTI_OPTION_FILTERS.include? key
        multi_option_hash(key, values)
      else
        single_option_hash(key, values)
      end
    end.compact
  end

  def multi_option_hash(key, values)
    values.map { |value| identifier_hash(key, value) }
  end

  def single_option_hash(key, value)
    if key == EvidenceHub::YearOfPublicationParser::FILTER
      value = EvidenceHub::YearOfPublicationParser.parse(value)
    end
    identifier_hash(key, value) if value
  end

  def identifier_hash(id, value)
    { identifier: id, value: value }
  end

  def filter_keys
    EvidenceSummarySearchForm.checkbox_filters +
      EvidenceSummarySearchForm.radio_button_filters
  end

  def key_info_filters(hash)
    hash[KEY_INFO_FILTER]
  end

  def convert_key_info_filters(key_info)
    blocks = key_info.map do |value|
      identifier_hash(KEY_INFO_FILTER, value)
    end

    { blocks: blocks }
  end
end
