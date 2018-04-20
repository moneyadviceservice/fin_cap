class DownloadComponent < BaseComponent
  HTML_ITEM_CLASS = 'download-box__list-item-link'.freeze

  def process
    return [] if block.blank?

    links.map do |element|
      element['class'] = HTML_ITEM_CLASS
      element.to_s
    end
  end
end
