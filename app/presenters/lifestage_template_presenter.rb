class LifestageTemplatePresenter < TemplatePresenter
  def steering_group_title_component
    view.strip_tags(steering_group_title_block.try(:content).to_s)
  end

  def steering_group_links_component
    render_component(:cta_links, content: steering_group_links_content)
  end

  def strategy_title_component
    view.strip_tags(strategy_title_block.try(:content).to_s)
  end

  def strategy_overview_component
    view.strip_tags(strategy_overview_block.try(:content).to_s)
  end

  def strategy_link_component
    render_component(:cta_links, content: strategy_link_content)
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

  def steering_group_links_content
    @steering_group_links_content ||= CtaLinksComponent.new(
      steering_group_links_block
    ).build_markup
  end

  def strategy_link_content
    @strategy_link_content ||= CtaLinksComponent.new(
      strategy_link_block
    ).build_markup
  end
end
