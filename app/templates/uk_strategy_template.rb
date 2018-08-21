class UkStrategyTemplate < ArticleTemplate
  REGIONAL_STRATEGY_TEXT_ID = 'regional_strategy_text'.freeze
  REGIONAL_STRATEGY_TITLE_ID = 'regional_strategy_title'.freeze
  REGIONAL_STRATEGY_LINK_ID = 'regional_strategy_link'.freeze

  def regional_strategy_title_block
    find_block(REGIONAL_STRATEGY_TITLE_ID)
  end

  def regional_strategy_link_block
    find_block(REGIONAL_STRATEGY_LINK_ID)
  end

  def regional_strategy_text_block
    find_block(REGIONAL_STRATEGY_TEXT_ID)
  end
end
