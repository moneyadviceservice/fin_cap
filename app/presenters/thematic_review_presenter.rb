class ThematicReviewPresenter < EvidenceSummaryPresenter
  def hero_image_src
    hero_image_block ? view.strip_tags(hero_image_block['content'].squish) : ''
  end

  private

  def hero_image_block
    find_block(BaseTemplate::HERO_IMAGE_IDENTIFIER)
  end

  def find_block(identifier)
    object.blocks.find do |block|
      block['identifier'] == identifier
    end
  end
end
