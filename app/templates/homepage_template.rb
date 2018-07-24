class HomepageTemplate < ArticleTemplate
  HORIZONTAL_TEASER_IMAGE_ID = 'horizontal_teaser_image'.freeze
  HORIZONTAL_TEASER_LINK_ID = 'horizontal_teaser_link'.freeze
  HORIZONTAL_TEASER_TEXT_ID = 'horizontal_teaser_text'.freeze
  HORIZONTAL_TEASER_TITLE_ID = 'horizontal_teaser_title'.freeze

  def horizontal_teaser_image_block
    find_block(HORIZONTAL_TEASER_IMAGE_ID)
  end

  def horizontal_teaser_link_block
    find_block(HORIZONTAL_TEASER_LINK_ID)
  end

  def horizontal_teaser_text_block
    find_block(HORIZONTAL_TEASER_TEXT_ID)
  end

  def horizontal_teaser_title_block
    find_block(HORIZONTAL_TEASER_TITLE_ID)
  end
end
