class TaggedNews
  def self.all(article)
    news_items = Mas::Cms::News.all(params: { tag: Array(article.tags) })

    news_items.reject { |news_item| news_item.slug == article.slug }
  end
end
