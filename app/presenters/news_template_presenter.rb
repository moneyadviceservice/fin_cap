class NewsTemplatePresenter < TemplatePresenter
  LINK_CSS_SELECTOR = 'p a'.freeze

  def order_by_date_component
    format_date(
      view.strip_tags(order_by_date_block.try(:content))
    )
  end

  def news_cta_links_component
    extract_links(cta_links_block.try(:content).to_s)
  end

  private

  def order_by_date
    view.strip_tags(order_by_date_block.try(:content).to_s)
  end

  def format_date(date_string)
    date_string ? view.l(date_string.to_s.to_date, format: :to_word) : ''
  end

  def extract_links(html_string)
    document = Nokogiri::HTML(html_string)
    document.css(LINK_CSS_SELECTOR).map do |anchor|
      { text: anchor.text, href: anchor.attribute('href').value }
    end
  end

  
end
