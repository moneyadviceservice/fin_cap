class HomepageTemplatePresenter < ArticleTemplatePresenter
  def horizontal_teaser_image_component
    view.strip_tags(horizontal_teaser_image_block.try(:content).to_s)
  end

  def horizontal_teaser_link_component
    extract_links(horizontal_teaser_link_block.try(:content).to_s)
  end

  def horizontal_teaser_text_component
    view.strip_tags(horizontal_teaser_text_block.try(:content).to_s)
  end

  def horizontal_teaser_title_component
    view.strip_tags(horizontal_teaser_title_block.try(:content).to_s)
  end
end
