class FincapArticle
  DOWNLOAD_COMPONENT_IDENTIFIER = 'component_download'.freeze
  CTA_LINKS_COMPONENT_IDENTIFIER = 'component_cta_links'.freeze

  delegate :title,
           :body,
           :non_content_blocks,
           to: :article

  attr_reader :article

  def initialize(article)
    @article = article
  end

  def cta_links_block
    find_block(CTA_LINKS_COMPONENT_IDENTIFIER)
  end

  def download_block
    find_block(DOWNLOAD_COMPONENT_IDENTIFIER)
  end

  private

  def find_block(identifier)
    non_content_blocks.find do |block|
      block.identifier == identifier
    end
  end
end
