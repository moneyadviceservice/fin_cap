class LifestageTemplatePresenter < ArticleTemplatePresenter
  def steering_group_title_component
    view.strip_tags(steering_group_title_block.try(:content).to_s)
  end

  def steering_group_links_component
    extract_links(steering_group_links_block.try(:content).to_s)
  end

  def strategy_overview_component
    view.strip_tags(strategy_overview_block.try(:content).to_s)
  end
end
