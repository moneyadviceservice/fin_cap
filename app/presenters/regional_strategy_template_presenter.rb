class RegionalStrategyTemplatePresenter < TemplatePresenter
  def forum_title_component
    view.strip_tags(forum_title_block.try(:content).to_s)
  end

  def forum_links_component
    extract_links(forum_links_block.try(:content).to_s)
  end

  def strategy_title_component
    view.strip_tags(strategy_title_block.try(:content).to_s)
  end

  def strategy_text_component
    view.strip_tags(strategy_text_block.try(:content).to_s)
  end

  def strategy_link_component
    extract_links(strategy_link_block.try(:content).to_s)
  end

  def teaser_section_title_component
    view.strip_tags(teaser_section_title_block.try(:content).to_s)
  end

  def teaser_image_component(number)
    view.strip_tags(teaser_image_block(number).try(:content).to_s)
  end

  def teaser_text_component(number)
    view.strip_tags(teaser_text_block(number).try(:content).to_s)
  end

  def teaser_title_component(number)
    view.strip_tags(teaser_title_block(number).try(:content).to_s)
  end

  private

  def extract_links(html_string)
    HtmlParser.new(html_string).extract_links
  end
end
