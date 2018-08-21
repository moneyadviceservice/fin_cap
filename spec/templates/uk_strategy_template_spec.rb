RSpec.describe UkStrategyTemplate do
  subject { described_class.new(article) }

  let(:article) do
    instance_double(Mas::Cms::Article, attributes)
  end

  describe '#regional_strategy_title_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'regional_strategy_title',
              content: 'Title'
            )
          ]
        }
      end

      it 'returns regional_strategy_title block' do
        expect(subject.regional_strategy_title_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'regional_strategy_title',
            content: 'Title'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.regional_strategy_title_block).to be_nil
      end
    end
  end

  describe '#regional_strategy_link_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'regional_strategy_link',
              content: 'Link'
            )
          ]
        }
      end

      it 'returns regional_strategy_link block' do
        expect(subject.regional_strategy_link_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'regional_strategy_link',
            content: 'Link'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.regional_strategy_link_block).to be_nil
      end
    end
  end

  describe '#regional_strategy_text_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'regional_strategy_text',
              content: 'Text'
            )
          ]
        }
      end

      it 'returns regional_strategy_text block' do
        expect(subject.regional_strategy_text_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'regional_strategy_text',
            content: 'Text'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.regional_strategy_text_block).to be_nil
      end
    end
  end
end
