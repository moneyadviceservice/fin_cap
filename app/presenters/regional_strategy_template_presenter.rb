class RegionalStrategyTemplatePresenter < ArticleTemplatePresenter
  def forum_title_component
    view.strip_tags(forum_title_block.try(:content).to_s)
  end

  def forum_links_component
    extract_links(forum_links_block.try(:content).to_s)
  end

  def strategy_text_component
    view.strip_tags(strategy_text_block.try(:content).to_s)
  end
end
