class LatestNewsTemplatePresenter < TemplatePresenter
  HERO_COLOUR = 'orange'.freeze

  def hero_colour_css_class
    "hero--#{HERO_COLOUR}"
  end
end
