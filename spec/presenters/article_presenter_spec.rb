RSpec.describe ArticlePresenter do
  let(:view) { ActionView::Base.new }
  let(:article) do
    double('Article', attributes)
  end
  subject(:presenter) { described_class.new(article, view) }

  describe '#download_content' do
    # rubocop:disable Metrics/LineLength
    context 'when articles has download content' do
      let(:attributes) do
        {
          extra_blocks: [
            double(
              identifier: 'component_download',
              content: <<-CONTENT
                <p>
                  <a href="/financial+capability+strategy.pdf">UK Strategy</a>
                  <a href="/detailed-strategy.pdf">UK Detailed Strategy</a>
                  <a href="/key-statistics.pdf">Key statistics on Financial Capability</a>
                  <a href="/fincap+progress+report+2017.pdf">Financial Capability Progress Report 2017</a>
                </p>
              CONTENT
            )
          ]
        }
      end

      it 'returns 4 links adding a html class to them' do
        expect(presenter.download_content).to match_array(
          [
            '<a href="/financial+capability+strategy.pdf" class="download-box__list-item-link">UK Strategy</a>',
            '<a href="/detailed-strategy.pdf" class="download-box__list-item-link">UK Detailed Strategy</a>',
            '<a href="/key-statistics.pdf" class="download-box__list-item-link">Key statistics on Financial Capability</a>',
            '<a href="/fincap+progress+report+2017.pdf" class="download-box__list-item-link">Financial Capability Progress Report 2017</a>'
          ]
        )
      end
    end
    # rubocop:enable Metrics/LineLength

    context 'when article does not have download content' do
      let(:attributes) { { extra_blocks: [] } }

      it 'returns empty array' do
        expect(presenter.download_content).to be_empty
      end
    end
  end
end
