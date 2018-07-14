class ArticleTemplate < BaseTemplate
  STRATEGY_TITLE_ID = 'strategy_title'.freeze
  STRATEGY_LINK_ID = 'strategy_link'.freeze
  TEASER_SECTION_TITLE_ID = 'teaser_section_title'.freeze
  TEASER_BOX_PREFIX = 'teaser'.freeze

  def strategy_title_block
    find_block(STRATEGY_TITLE_ID)
  end

  def strategy_link_block
    find_block(STRATEGY_LINK_ID)
  end

  def teaser_section_title_block
    find_block(TEASER_SECTION_TITLE_ID)
  end

  def teaser_image_block(number)
    find_block("#{TEASER_BOX_PREFIX}#{number}_image")
  end

  def teaser_link_block(number)
    find_block("#{TEASER_BOX_PREFIX}#{number}_link")
  end

  def teaser_text_block(number)
    find_block("#{TEASER_BOX_PREFIX}#{number}_text")
  end

  def teaser_title_block(number)
    find_block("#{TEASER_BOX_PREFIX}#{number}_title")
  end
end
