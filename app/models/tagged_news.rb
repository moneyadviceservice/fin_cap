class TaggedNews
  def self.all(page)
    Mas::Cms::News.all(
      params: {
        document_type: [Mas::Cms::News::PAGE_TYPE],
        tag: Array(page.tags),
        order_by_date: true
      }
    ).reject { |news_item| news_item.slug == page.slug }
  end
end
