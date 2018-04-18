class ArticlesController < ApplicationController
  def article
    @article ||= ArticlePresenter.new(
      Mas::Cms::Article.find(params[:id]),
      view_context
    )
  end
  helper_method :article
end
