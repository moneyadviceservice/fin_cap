RSpec.describe HomepageTemplatePresenter do
  let(:view) { ActionView::Base.new(ActionView::LookupContext.new(nil), {}, nil) }
  let(:object) do
    double('HomepageTemplate', attributes)
  end
  subject(:presenter) { described_class.new(object, view) }

  describe '#horizontal_teaser_image_component' do
    context 'when object has the corresponding block' do
      let(:attributes) do
        {
          horizontal_teaser_image_block: double(
            content: '<p>path-to-image.pdf</p>'
          )
        }
      end

      it 'returns the horizontal teaser image content' do
        expect(presenter.horizontal_teaser_image_component).to eq(
          'path-to-image.pdf'
        )
      end
    end

    context 'when object does not have teaser image' do
      let(:attributes) { { horizontal_teaser_image_block: nil } }

      it 'returns empty' do
        expect(presenter.horizontal_teaser_image_component).to be_empty
      end
    end
  end

  describe '#horizontal_teaser_link_component' do
    context 'when object has the corresponding block' do
      let(:attributes) do
        {
          horizontal_teaser_link_block: double(
            content: '<p><a href="path-to-link">cta text</a></p>'
          )
        }
      end

      it 'returns the horizontal teaser link content' do
        expect(presenter.horizontal_teaser_link_component).to eq(
          [{ text: 'cta text', href: 'path-to-link' }]
        )
      end
    end

    context 'when object does not have teaser link' do
      let(:attributes) { { horizontal_teaser_link_block: nil } }

      it 'returns empty' do
        expect(presenter.horizontal_teaser_link_component).to be_empty
      end
    end
  end

  describe '#horizontal_teaser_text_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          horizontal_teaser_text_block: double(
            content: '<p>Horizontal teaser text</p>'
          )
        }
      end

      it 'returns the horizontal teaser text' do
        expect(presenter.horizontal_teaser_text_component).to eq(
          'Horizontal teaser text'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { horizontal_teaser_text_block: nil }
      end

      it 'returns empty' do
        expect(presenter.horizontal_teaser_text_component).to be_empty
      end
    end
  end

  describe '#horizontal_teaser_title_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          horizontal_teaser_title_block: double(
            content: '<p>Horizontal teaser title</p>'
          )
        }
      end

      it 'returns the horizontal teaser title' do
        expect(presenter.horizontal_teaser_title_component).to eq(
          'Horizontal teaser title'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { horizontal_teaser_title_block: nil }
      end

      it 'returns empty' do
        expect(presenter.horizontal_teaser_title_component).to be_empty
      end
    end
  end
end
