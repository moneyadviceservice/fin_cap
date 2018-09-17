module SharedComponents
  module Teaser
    def teaser_section_title_component
      view.strip_tags(teaser_section_title_block.try(:content).to_s)
    end

    def teaser_link_component(number)
      extract_links(teaser_link_block(number).try(:content).to_s)
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
  end
end
