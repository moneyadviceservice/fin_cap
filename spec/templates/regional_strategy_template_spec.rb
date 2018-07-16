RSpec.describe RegionalStrategyTemplate do
  subject { described_class.new(article) }
  let(:article) do
    double('Mas::Cms::Article', attributes)
  end

  describe '.forum_title_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'forum_title',
              content: 'Forum'
            )
          ]
        }
      end

      it 'returns forum_title block' do
        expect(subject.forum_title_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'forum_title',
            content: 'Forum'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.forum_title_block).to be_nil
      end
    end
  end

  describe '.forum_links_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'forum_links',
              content: 'bunch of links'
            )
          ]
        }
      end

      it 'returns forum_links block' do
        expect(subject.forum_links_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'forum_links',
            content: 'bunch of links'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.forum_links_block).to be_nil
      end
    end
  end

  describe '.strategy_text_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'strategy_text',
              content: 'some text'
            )
          ]
        }
      end

      it 'returns strategy text block' do
        expect(subject.strategy_text_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'strategy_text',
            content: 'some text'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.strategy_text_block).to be_nil
      end
    end
  end
end
