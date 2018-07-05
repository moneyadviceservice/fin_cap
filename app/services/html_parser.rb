class HtmlParser
  LINK_CSS_SELECTOR = 'p a'.freeze

  attr_accessor :html_string

  def initialize(html_string)
    @html_string = html_string
  end

  def extract_links
    links = Nokogiri::HTML(html_string).css(LINK_CSS_SELECTOR)
  rescue NoMethodError
    []
  else
    links.map do |anchor|
      { text: anchor.text, href: anchor.attribute('href').value }
    end
  end
end
