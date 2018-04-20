class CtaLinksComponent < BaseComponent
  def process
    links.map(&:to_s)
  end
end
