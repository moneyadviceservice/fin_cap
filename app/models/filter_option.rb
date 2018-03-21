class FilterOption
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def underscore
    value.gsub(/[^a-zA-Z. ]/, ' ').strip.split(' ').map(&:downcase).join('_')
  end
end
