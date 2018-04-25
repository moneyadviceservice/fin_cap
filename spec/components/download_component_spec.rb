RSpec.describe DownloadComponent do
  subject(:component) do
    described_class.new(block)
  end

  describe '#build_markup' do
    subject(:build_markup) { component.build_markup }

    # rubocop:disable Metrics/LineLength
    context 'when articles has download content' do
      let(:block) do
        double(
          content: <<-CONTENT
            <p>
              <a href="/financial+capability+strategy.pdf">UK Strategy</a>
              <a href="/detailed-strategy.pdf">UK Detailed Strategy</a>
              <a href="/key-statistics.pdf">Key statistics on Financial Capability</a>
              <a href="/fincap+progress+report+2017.pdf">Financial Capability Progress Report 2017</a>
            </p>
          CONTENT
        )
      end

      it 'returns 4 links adding a html class to them' do
        expect(build_markup).to match_array(
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
      let(:block) { double(content: nil) }

      it 'returns empty array' do
        expect(build_markup).to eq([])
      end
    end
  end
end
