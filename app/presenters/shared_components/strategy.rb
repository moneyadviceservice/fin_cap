module SharedComponents
  module Strategy
    def strategy_overview_component
      view.strip_tags(strategy_overview_block.try(:content).to_s)
    end

    def strategy_text_component
      view.strip_tags(strategy_text_block.try(:content).to_s)
    end

    def strategy_title_component
      view.strip_tags(strategy_title_block.try(:content).to_s)
    end

    def strategy_link_component
      extract_links(strategy_link_block.try(:content).to_s)
    end
  end
end
