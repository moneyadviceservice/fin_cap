RSpec.describe ArticleTemplatePresenter do
  let(:view) { ActionView::Base.new }
  let(:object) do
    double('ArticleTemplate', attributes)
  end
  subject(:presenter) { described_class.new(object, view) }

  describe '#strategy_title_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          strategy_title_block: double(
            content: '<p>Strategy title</p>'
          )
        }
      end

      it 'returns array of hashes containing link attributes' do
        expect(presenter.strategy_title_component).to eq('Strategy title')
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { strategy_title_block: double(content: '') }
      end

      it 'returns empty' do
        expect(presenter.strategy_title_component).to be_empty
      end
    end
  end

  describe '#strategy_link_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          strategy_link_block: double(
            content: '<p><a href="/strategy.pdf">strategy link content</a></p>'
          )
        }
      end

      it 'returns array of hashes containing link attributes' do
        expected_result = [
          { href: '/strategy.pdf', text: 'strategy link content' }
        ]
        expect(presenter.strategy_link_component).to eq(expected_result)
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { strategy_link_block: double(content: '') }
      end

      it 'returns empty' do
        expect(presenter.strategy_link_component).to be_empty
      end
    end
  end

  describe '#teaser_section_title_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          teaser_section_title_block: double(content: '<p>Fincap in action</p>')
        }
      end

      it 'returns the teaser section title' do
        expect(presenter.teaser_section_title_component).to eq(
          'Fincap in action'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { teaser_section_title_block: nil }
      end

      it 'returns empty' do
        expect(presenter.teaser_section_title_component).to be_empty
      end
    end
  end

  describe '#teaser_image_component' do
    context 'when object has teaser image' do
      let(:attributes) do
        {
          teaser5_image_block: teaser5_image_block
        }
      end

      let(:teaser5_image_block) do
        double(:block,
               identifier: 'teaser5_image_block',
               content: '<p>/assets/teaser5_image</p>')
      end

      it 'returns the teaser image content' do
        expect(object)
          .to receive(:teaser_image_block)
          .with(5)
          .and_return(teaser5_image_block)

        expect(view)
          .to receive(:strip_tags)
          .with(teaser5_image_block.content)
          .and_return('/assets/teaser5_image')

        presenter.teaser_image_component(5)
      end
    end

    context 'when object does not have teaser image' do
      let(:attributes) do
        { teaser3_image: nil }
      end

      it 'returns empty' do
        expect(object)
          .to receive(:teaser_image_block)
          .with(3)
          .and_return('')

        expect(view)
          .to receive(:strip_tags)
          .with('')
          .and_return('')

        presenter.teaser_image_component(3)
      end
    end
  end

  describe '#teaser_link_component' do
    context 'when object has teaser link' do
      let(:attributes) do
        {
          teaser3_link_block: teaser3_link_block
        }
      end

      let(:teaser3_link_block) do
        double(:block,
               identifier: 'teaser3_link_block',
               content: '<p><a href= "#">teaser text</a></p>')
      end

      it 'returns the teaser link content' do
        expect(object)
          .to receive(:teaser_link_block)
          .with(3)
          .and_return(teaser3_link_block)

        expect(HtmlParser)
          .to receive_message_chain(%i[new extract_links])
          .with(teaser3_link_block).with(no_args)

        presenter.teaser_link_component(3)
      end
    end
  end

  describe '#teaser_text_component' do
    context 'when object has teaser text' do
      let(:attributes) do
        {
          teaser3_text_block: teaser3_text_block
        }
      end

      let(:teaser3_text_block) do
        double(:block,
               identifier: 'teaser3_text_block', content: '<p>teaser text</p>')
      end

      it 'returns the teaser text content' do
        expect(object)
          .to receive(:teaser_text_block)
          .with(3)
          .and_return(teaser3_text_block)

        expect(view)
          .to receive(:strip_tags)
          .with(teaser3_text_block.content)
          .and_return('teaser text')

        presenter.teaser_text_component(3)
      end
    end
  end

  describe '#teaser_title_component' do
    context 'when object has teaser title' do
      let(:attributes) do
        {
          teaser3_title_block: teaser3_title_block
        }
      end

      let(:teaser3_title_block) do
        double(:block,
               identifier: 'teaser3_title_block', content: '<p>title</p>')
      end

      it 'returns the teaser title content' do
        expect(object)
          .to receive(:teaser_title_block)
          .with(3)
          .and_return(teaser3_title_block)

        expect(view)
          .to receive(:strip_tags)
          .with(teaser3_title_block.content)
          .and_return('title')

        presenter.teaser_title_component(3)
      end
    end
  end
end
