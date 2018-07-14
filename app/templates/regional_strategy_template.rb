class RegionalStrategyTemplate < TeaserTemplate
  FORUM_TITLE_ID = 'forum_title'.freeze
  FORUM_LINKS_ID = 'forum_links'.freeze
  STRATEGY_TITLE_ID = 'strategy_title'.freeze
  STRATEGY_TEXT_ID = 'strategy_text'.freeze
  STRATEGY_LINK_ID = 'strategy_link'.freeze

  def forum_title_block
    find_block(FORUM_TITLE_ID)
  end

  def forum_links_block
    find_block(FORUM_LINKS_ID)
  end

  def strategy_title_block
    find_block(STRATEGY_TITLE_ID)
  end

  def strategy_text_block
    find_block(STRATEGY_TEXT_ID)
  end

  def strategy_link_block
    find_block(STRATEGY_LINK_ID)
  end
end
