RSpec.describe BaseTemplate do
  subject { described_class.new(article) }
  let(:article) do
    double('Mas::Cms::Article', attributes)
  end

  describe '#feedback_block' do
    context 'when blocks is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'component_feedback',
              content: 'email@moneyadviceservice.org.uk'
            )
          ]
        }
      end

      it 'returns feedback component' do
        expect(subject.feedback_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'component_feedback',
            content: 'email@moneyadviceservice.org.uk'
          )
        )
      end
    end

    context 'when blocks is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.feedback_block).to be_nil
      end
    end
  end

  describe '.download_block' do
    context 'when blocks is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'component_download',
              content: 'some content'
            )
          ]
        }
      end

      it 'returns download component' do
        expect(subject.download_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'component_download',
            content: 'some content'
          )
        )
      end
    end

    context 'when download blocks is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.download_block).to be_nil
      end
    end
  end

  describe '.cta_links_block' do
    context 'when blocks is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'component_cta_links',
              content: 'some content'
            )
          ]
        }
      end

      it 'returns cta links component' do
        expect(subject.cta_links_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'component_cta_links',
            content: 'some content'
          )
        )
      end
    end

    context 'when cta blocks is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.cta_links_block).to be_nil
      end
    end
  end
end
