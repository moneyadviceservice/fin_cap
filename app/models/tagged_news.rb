class TaggedNews
  UNLIMITED = 999_999

  def self.all(article)
    news_items = Mas::Cms::News.all(
      params: {
        per_page: UNLIMITED,
        document_type: [Mas::Cms::News::PAGE_TYPE],
        tag: Array(article.tags)
      }
    ).reject { |news_item| news_item.slug == article.slug }

    sort_by_published_date(news_items)
  end

  def self.sort_by_published_date(news_items)
    news_items.sort_by(&:published_date).reverse
  end
end
