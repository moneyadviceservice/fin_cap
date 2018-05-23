class BaseTemplate
  HERO_IMAGE_IDENTIFIER = 'component_hero_image'.freeze
  HERO_DESCRIPTION_IDENTIFIER = 'component_hero_description'.freeze
  DOWNLOAD_COMPONENT_IDENTIFIER = 'component_download'.freeze
  CTA_LINKS_COMPONENT_IDENTIFIER = 'component_cta_links'.freeze
  FEEDBACK_COMPONENT_IDENTIFIER = 'component_feedback'.freeze

  delegate :title,
           :body,
           :non_content_blocks,
           to: :article

  attr_reader :article

  def initialize(article)
    @article = article
  end

  def hero_image_block
    find_block(HERO_IMAGE_IDENTIFIER)
  end

  def hero_description_block
    find_block(HERO_DESCRIPTION_IDENTIFIER)
  end

  def cta_links_block
    find_block(CTA_LINKS_COMPONENT_IDENTIFIER)
  end

  def download_block
    find_block(DOWNLOAD_COMPONENT_IDENTIFIER)
  end

  def feedback_block
    find_block(FEEDBACK_COMPONENT_IDENTIFIER)
  end

  private

  def find_block(identifier)
    non_content_blocks.find do |block|
      block.identifier == identifier
    end
  end
end
