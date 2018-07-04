class LifestageTemplatePresenter < TemplatePresenter
  LINK_CSS_SELECTOR = 'p a'.freeze

  def steering_group_title_component
    view.strip_tags(steering_group_title_block.try(:content).to_s)
  end

  def steering_group_links_component
    extract_links(steering_group_links_block.try(:content).to_s)
  end

  def strategy_title_component
    view.strip_tags(strategy_title_block.try(:content).to_s)
  end

  def strategy_overview_component
    view.strip_tags(strategy_overview_block.try(:content).to_s)
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
    document = Nokogiri::HTML(html_string)
    document.css(LINK_CSS_SELECTOR).map do |anchor|
      { text: anchor.text, href: anchor.attribute('href').value }
    end
  end
end
