module World
  module Pages
    def current_page
      UI::Page.new
    end

    pages = %w[
      article
      evidence_summaries
      evidence_summary
      thematic_review
    ]

    pages.each do |page|
      define_method("#{page}_page") do
        "UI::Pages::#{page.camelize}".constantize.new
      end
    end
  end
end

World(World::Pages)
