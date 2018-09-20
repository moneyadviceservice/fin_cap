class ArticleTemplatePresenter < TemplatePresenter
  include SharedComponents::Strategy
  include SharedComponents::Teaser

  delegate :meta_description, :meta_title, to: :article
end
