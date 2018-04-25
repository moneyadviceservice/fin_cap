class CtaLinksComponent < BaseComponent
  def build_markup
    links.map(&:to_s)
  end
end
