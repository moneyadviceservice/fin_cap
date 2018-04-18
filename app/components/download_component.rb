class DownloadComponent
  attr_reader :block, :document
  HTML_ITEM_CLASS = 'download-box__list-item-link'.freeze

  def initialize(block)
    @block = block
  end

  def process
    return [] if block.blank?

    Nokogiri::HTML(block.content).xpath('//a').map do |element|
      element['class'] = HTML_ITEM_CLASS
      element.to_s
    end
  end
end
