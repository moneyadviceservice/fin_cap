class LifestageTemplatePresenter < TemplatePresenter
  def teaser_section_title_component
    view.strip_tags(teaser_section_title_block.try(:content).to_s)
  end
end
