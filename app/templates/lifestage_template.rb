class LifestageTemplate < TeaserTemplate
  STEERING_GROUP_TITLE_ID = 'steering_group_title'.freeze
  STEERING_GROUP_LINKS_ID = 'steering_group_links'.freeze
  STRATEGY_TITLE_ID = 'strategy_title'.freeze
  STRATEGY_OVERVIEW_ID = 'strategy_overview'.freeze
  STRATEGY_LINK_ID = 'strategy_link'.freeze

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
end
