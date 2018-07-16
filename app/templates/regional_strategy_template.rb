class RegionalStrategyTemplate < ArticleTemplate
  FORUM_TITLE_ID = 'forum_title'.freeze
  FORUM_LINKS_ID = 'forum_links'.freeze
  STRATEGY_TEXT_ID = 'strategy_text'.freeze

  def forum_title_block
    find_block(FORUM_TITLE_ID)
  end

  def forum_links_block
    find_block(FORUM_LINKS_ID)
  end

  def strategy_text_block
    find_block(STRATEGY_TEXT_ID)
  end
end
