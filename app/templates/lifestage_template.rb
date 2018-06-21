class LifestageTemplate < BaseTemplate
  STEERING_GROUP_TITLE_ID = 'steering_group_title'.freeze
  STEERING_GROUP_LINKS_ID = 'steering_group_links'.freeze
  STRATEGY_TITLE_ID = 'strategy_title'.freeze
  STRATEGY_OVERVIEW_ID = 'strategy_overview'.freeze
  STRATEGY_LINK_ID = 'strategy_link'.freeze
  TEASER_SECTION_TITLE_ID = 'teaser_section_title'.freeze
  TEASER_BOX_PREFIX = 'teaser'.freeze

  def steering_group_title_block
    find_block(STEERING_GROUP_TITLE_ID)
  end

  def steering_group_links_block
    find_block(STEERING_GROUP_LINKS_ID)
  end

  def strategy_title_block
    find_block(STRATEGY_TITLE_ID)
  end

  def strategy_overview_block
    find_block(STRATEGY_OVERVIEW_ID)
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
