class NewsTemplatePresenter < ArticleTemplatePresenter
  def order_by_date_component
    format_date(
      view.strip_tags(order_by_date_block.try(:content))
    )
  end

  def news_cta_links_component
    extract_links(cta_links_block.try(:content).to_s)
  end

  private

  def format_date(date_string)
    date_string ? view.l(date_string.to_s.to_date, format: :to_word) : ''
  end
end
