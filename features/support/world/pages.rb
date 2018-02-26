module World
  module Pages
    def current_page
      UI::Page.new
    end

    pages = %w[
      evidence_hub_summary
    ]

    pages.each do |page|
      define_method("#{page}_page") do
        "UI::Pages::#{page.camelize}".constantize.new
      end
    end
  end
end

World(World::Pages)
