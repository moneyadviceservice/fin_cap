class TemplatePresenter < BasePresenter
  def hero_image_component
    view.strip_tags(hero_image_block.try(:content).to_s)
  end

  def hero_description_component
    view.strip_tags(hero_description_block.try(:content).to_s)
  end

  def download_component
    render_component(:download, content: download_content)
  end

  def cta_links_component
    render_component(:cta_links, content: cta_links_content)
  end

  def feedback_component
    render_component(:feedback, content: feedback_content)
  end

  def overview_content
    view.strip_tags(overview_block.try(:content).to_s)
  end

  def page_title(string)
    return unless string

    "#{string} | #{view.t('fincap.page_title')}"
  end

  protected

  def extract_links(html_string)
    HtmlParser.new(html_string).extract_links
  end

  private

  def download_content
    @download_content ||= DownloadComponent.new(download_block).build_markup
  end

  def cta_links_content
    @cta_links_content ||= CtaLinksComponent.new(cta_links_block).build_markup
  end

  def feedback_content
    view.strip_tags(feedback_block.try(:content))
  end

  def render_component(component_name, content:)
    return if content.blank?

    view.render("components/#{component_name}", content: content)
  end
end
