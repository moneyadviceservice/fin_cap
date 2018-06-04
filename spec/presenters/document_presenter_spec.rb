RSpec.describe DocumentPresenter do
  let(:view) { ActionView::Base.new }
  let(:object) { double('Document', blocks: blocks) }

  subject(:presenter) { described_class.new(object, view) }

  describe '#document_image_src' do
    context 'when object has hero description' do
      let(:blocks) do
        [
          {
            'identifier' => 'component_hero_image',
            'content' => "<p>/assets/styleguide/hero-sample.jpg</p>\n"
          }
        ]
      end

      it 'returns the hero description content' do
        expect(presenter.document_image_src).to eq(
          '/assets/styleguide/hero-sample.jpg'
        )
      end
    end

    context 'when object does not have hero description' do
      let(:blocks) do
        [
          {
            'identifier' => 'content',
            'content' => "<p>/assets/styleguide/hero-sample.jpg</p>\n"
          }
        ]
      end

      it 'returns empty' do
        expect(presenter.document_image_src).to eq('')
      end
    end
  end
end
