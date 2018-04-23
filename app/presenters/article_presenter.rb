class ArticlePresenter < BasePresenter
  DOWNLOAD_COMPONENT_IDENTIFIER = 'component_download'.freeze

  def download_component
    view.render('components/download', content: download_content)
  end

  def download_content
    DownloadComponent.new(download_block).process
  end

  private

  def download_block
    extra_blocks.find do |block|
      block.identifier == DOWNLOAD_COMPONENT_IDENTIFIER
    end
  end
end
