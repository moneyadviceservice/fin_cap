class FilterParser
  attr_accessor :filters
  def self.parse(filters)
    new(filters).parse
  end

  def initialize(filters)
    @filters = filters
  end

  def parse
    format_filters(filters.reject {|_,v| empty_filter?(v) } )
  end

  private
  def empty_filter?(value)
    empty_string?(value) || empty_array?(value)
  end

  def empty_string?(value)
    value.is_a?(String) && value.empty?
  end

  def empty_array?(value)
    value.is_a?(Array) && value.one? && value.first.empty?
  end

  def format_filters(filters)
    { blocks: blocks_hash(filters).flatten }
  end

  def blocks_hash(filters)
    filters.map do |id, values|
      if values.is_a?(Array)
        values.reject(&:blank?).map {|value| identifier_hash(id, value) }
      else
        identifier_hash(id, values)
      end
    end
  end

  def identifier_hash(id, value)
    { identifier: id, value: value }
  end
end
