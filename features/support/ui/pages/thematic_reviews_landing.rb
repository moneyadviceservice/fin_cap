require_relative '../page'

module UI::Pages
  class ThematicReviewsLanding < UI::Page
    class ThematicReview < SitePrism::Section
      element :title, '.teaser-box__content-link'
      element :overview, '.teaser-box__content-text'
    end

    set_url '/en/thematic_reviews'
    element :heading, '.hero__heading'

    sections :thematic_reviews, ThematicReview, '.teaser-box--thematic-review'
  end
end
