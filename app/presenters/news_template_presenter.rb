class NewsTemplatePresenter < TemplatePresenter
  def official_published_date_component
    format_date(view.strip_tags(official_published_date))
  end

  def news_cta_links_component
    extract_links(cta_links_block.try(:content).to_s)
  end

  private

  def official_published_date
    return article.created_at unless order_by_date_block

    order_by_date_block.content
  end

  def format_date(date_string)
    date_string ? view.l(date_string.to_s.to_date, format: :to_word) : ''
  end

  def extract_links(html_string)
    HtmlParser.new(html_string).extract_links
  end
end
