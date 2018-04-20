class ArticlesController < ApplicationController
  def article
    @article ||= ArticlePresenter.new(resource, view_context)
  end
  helper_method :article

  def resource
    FincapArticle.new(Mas::Cms::Article.find(params[:id]))
  end
end
