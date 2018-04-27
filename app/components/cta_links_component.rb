class CtaLinksComponent < BaseComponent
  def build_markup
    return [] if block.blank?

    links.map(&:to_s)
  end
end
