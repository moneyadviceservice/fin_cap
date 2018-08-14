class UkStrategyTemplatePresenter < ArticleTemplatePresenter
  def regional_strategy_title_component
    view.strip_tags(regional_strategy_title_block.try(:content).to_s)
  end

  def regional_strategy_link_component
    extract_links(regional_strategy_link_block.try(:content).to_s)
      .first
      .try(:values)
  end

  def regional_strategy_text_component
    view.strip_tags(regional_strategy_text_block.try(:content).to_s)
  end
end
