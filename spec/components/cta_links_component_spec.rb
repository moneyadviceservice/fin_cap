RSpec.describe CtaLinksComponent do
  subject(:component) do
    described_class.new(block)
  end

  describe '#build_markup' do
    subject(:build_markup) { component.build_markup }

    context 'when content is present' do
      # rubocop:disable Metrics/LineLength
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

      it 'returns an array of links' do
        expect(build_markup).to match_array(
          [
            '<a href="/financial+capability+strategy.pdf">UK Strategy</a>',
            '<a href="/detailed-strategy.pdf">UK Detailed Strategy</a>',
            '<a href="/key-statistics.pdf">Key statistics on Financial Capability</a>',
            '<a href="/fincap+progress+report+2017.pdf">Financial Capability Progress Report 2017</a>'
          ]
        )
      end
    end
    # rubocop:enable Metrics/LineLength

    context 'when block is blank' do
      let(:block) { nil }

      it 'returns empty array' do
        expect(build_markup).to eq([])
      end
    end

    context 'when content is blank' do
      let(:block) { double(content: nil) }

      it 'returns empty array' do
        expect(build_markup).to eq([])
      end
    end
  end
end
