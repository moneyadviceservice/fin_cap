module SharedComponents
  module SteeringGroup
    def steering_group_title_component
      view.strip_tags(steering_group_title_block.try(:content).to_s)
    end

    def steering_group_links_component
      extract_links(steering_group_links_block.try(:content).to_s)
    end
  end
end
