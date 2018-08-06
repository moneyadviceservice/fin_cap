RSpec.describe ArticleTemplate do
  subject { described_class.new(article) }
  let(:article) do
    double('Mas::Cms::Article', attributes)
  end

  describe '.strategy_title_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'strategy_title',
              content: 'strategy extract'
            )
          ]
        }
      end

      it 'returns strategy title block' do
        expect(subject.strategy_title_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'strategy_title',
            content: 'strategy extract'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.strategy_title_block).to be_nil
      end
    end
  end

  describe '.strategy_link_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'strategy_link',
              content: 'some link'
            )
          ]
        }
      end

      it 'returns strategy link block' do
        expect(subject.strategy_link_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'strategy_link',
            content: 'some link'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.strategy_link_block).to be_nil
      end
    end
  end

  describe '.teaser_section_title_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'teaser_section_title',
              content: 'teaser section title'
            )
          ]
        }
      end

      it 'returns teaser section title block' do
        expect(subject.teaser_section_title_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'teaser_section_title',
            content: 'teaser section title'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.teaser_section_title_block).to be_nil
      end
    end
  end

  describe '.teaser_link_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'teaser2_link',
              content: 'Read more'
            )
          ]
        }
      end

      it 'returns the numbered teaser image block for a given number' do
        expect(subject.teaser_link_block(2)).to eq(
          Mas::Cms::Block.new(
            identifier: 'teaser2_link',
            content: 'Read more'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.teaser_link_block(2)).to be_nil
      end
    end
  end

  describe '.teaser_image_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'teaser3_image',
              content: 'teaser image source'
            )
          ]
        }
      end

      it 'returns the numbered teaser image block for a given number' do
        expect(subject.teaser_image_block(3)).to eq(
          Mas::Cms::Block.new(
            identifier: 'teaser3_image',
            content: 'teaser image source'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.teaser_image_block(3)).to be_nil
      end
    end
  end

  describe '.teaser_link_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'teaser2_link',
              content: 'teaser link'
            )
          ]
        }
      end

      it 'returns the numbered teaser link block for a given number' do
        expect(subject.teaser_link_block(2)).to eq(
          Mas::Cms::Block.new(
            identifier: 'teaser2_link',
            content: 'teaser link'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.teaser_link_block(2)).to be_nil
      end
    end
  end

  describe '.teaser_text_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'teaser1_text',
              content: 'teaser text'
            )
          ]
        }
      end

      it 'returns the numbered teaser text block for a given number' do
        expect(subject.teaser_text_block(1)).to eq(
          Mas::Cms::Block.new(
            identifier: 'teaser1_text',
            content: 'teaser text'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.teaser_text_block(1)).to be_nil
      end
    end
  end

  describe '.teaser_title_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'teaser4_title',
              content: 'teaser title'
            )
          ]
        }
      end

      it 'returns the numbered teaser title block for a given number' do
        expect(subject.teaser_title_block(4)).to eq(
          Mas::Cms::Block.new(
            identifier: 'teaser4_title',
            content: 'teaser title'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.teaser_title_block(4)).to be_nil
      end
    end
  end
end
