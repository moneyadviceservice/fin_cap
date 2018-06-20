class LifestageTemplate < BaseTemplate
  TEASER_SECTION_TITLE_ID = 'teaser_section_title'.freeze

  def teaser_section_title_block
    find_block(TEASER_SECTION_TITLE_ID)
  end
end
