class TaggedNews
  def self.all(page)
    params = {
      params: {
        document_type: [Mas::Cms::News::PAGE_TYPE],
        order_by_date: true
      }
    }

    params[:params][:tag] = Array(page.tags) if page.tags.present?

    Mas::Cms::News.all(params).reject { |news_item| news_item.slug == page.slug }
  end
end
