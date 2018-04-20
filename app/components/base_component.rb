class BaseComponent
  attr_reader :block

  def initialize(block)
    @block = block
  end

  def links
    Nokogiri::HTML(block.content).xpath('//a')
  end
end
