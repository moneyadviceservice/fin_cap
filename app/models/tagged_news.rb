class TaggedNews
  def self.all(article)
    news_items = Mas::Cms::News.all(
      params: {
        document_type: [Mas::Cms::News::PAGE_TYPE],
        tag: Array(article.tags)
      }
    )

    news_items.reject { |news_item| news_item.slug == article.slug }
  end
end
