RSpec.describe HomepageTemplate do
  subject { described_class.new(article) }
  let(:article) do
    double('Mas::Cms::Homepage', attributes)
  end

  describe '.horizontal_teaser_image_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'horizontal_teaser_image',
              content: 'path/to/image.pdf'
            )
          ]
        }
      end

      it 'returns horizontal_teaser_image block' do
        expect(subject.horizontal_teaser_image_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'horizontal_teaser_image',
            content: 'path/to/image.pdf'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.horizontal_teaser_image_block).to be_nil
      end
    end
  end

  describe '.horizontal_teaser_link_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'horizontal_teaser_link',
              content: 'bunch of links'
            )
          ]
        }
      end

      it 'returns horizontal_teaser_link block' do
        expect(subject.horizontal_teaser_link_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'horizontal_teaser_link',
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
        expect(subject.horizontal_teaser_link_block).to be_nil
      end
    end
  end

  describe '.horizontal_teaser_text_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'horizontal_teaser_text',
              content: 'Horizontal teaser text'
            )
          ]
        }
      end

      it 'returns horizontal_teaser_text block' do
        expect(subject.horizontal_teaser_text_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'horizontal_teaser_text',
            content: 'Horizontal teaser text'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.horizontal_teaser_text_block).to be_nil
      end
    end
  end

  describe '.horizontal_teaser_title_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'horizontal_teaser_title',
              content: 'Horizontal teaser title'
            )
          ]
        }
      end

      it 'returns horizontal_teaser_title block' do
        expect(subject.horizontal_teaser_title_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'horizontal_teaser_title',
            content: 'Horizontal teaser title'
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.horizontal_teaser_title_block).to be_nil
      end
    end
  end
end
