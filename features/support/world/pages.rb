module World
  module Pages
    def current_page
      UI::Page.new
    end

    pages = %w[
      article
      error
      evidence_summaries
      evidence_summary
      home
      impact_principles
      lifestage
      latest_news
      news
      regional_strategy
      search_results
      thematic_review
      thematic_reviews_landing
      uk_strategy
      what_works
    ]

    pages.each do |page|
      define_method("#{page}_page") do
        "UI::Pages::#{page.camelize}".constantize.new
      end
    end
  end
end

World(World::Pages)
