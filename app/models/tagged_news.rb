class TaggedNews < SimpleDelegator
  def self.all(article)
    news_items = Mas::Cms::News.all(
      params: {
        document_type: [Mas::Cms::News::PAGE_TYPE],
        tag: Array(article.tags)
      }
    ).reject { |news_item| news_item.slug == article.slug }

    sort_by_published_date(news_items)
  end

  def self.sort_by_published_date(news_items)
    news_items.map do |news_item|
      new(news_item)
    end.sort_by(&:published_date).reverse
  end

  def published_date
    content = non_content_blocks.find do |block|
      block.identifier == 'order_by_date'
    end.content

    Date.parse(ActionView::Base.full_sanitizer.sanitize(content.strip))
  end
end
