class FilterParser
  attr_accessor :filters
  def self.parse(filters)
    new(filters).parse
  end

  def initialize(filters)
    @filters = filters
  end

  def parse
    { blocks: blocks_hash.flatten }
  end

  private

  def blocks_hash
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
