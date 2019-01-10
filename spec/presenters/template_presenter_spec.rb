RSpec.describe TemplatePresenter do
  let(:view) { ActionView::Base.new }
  let(:object) do
    double('BaseTemplate', attributes)
  end
  subject(:presenter) { described_class.new(object, view) }

  describe '#hero_description_component' do
    context 'when object has hero description' do
      let(:attributes) do
        {
          hero_description_block: double(content: '<p>Financial capability</p>')
        }
      end

      it 'returns the hero description content' do
        expect(presenter.hero_description_component).to eq(
          'Financial capability'
        )
      end
    end

    context 'when object does not have hero description' do
      let(:attributes) do
        { hero_description_block: nil }
      end

      it 'returns empty' do
        expect(presenter.hero_description_component).to be_empty
      end
    end
  end

  describe '#hero_image_component' do
    context 'when object has hero image' do
      let(:attributes) do
        {
          hero_image_block: double(content: '<p>/assets/hero_image</p>')
        }
      end

      it 'returns the hero image content without tags' do
        expect(presenter.hero_image_component).to eq('/assets/hero_image')
      end
    end

    context 'when object does not have hero image' do
      let(:attributes) do
        { hero_image_block: nil }
      end

      it 'returns empty' do
        expect(presenter.hero_image_component).to be_empty
      end
    end
  end

  describe '#download_component' do
    context 'when object has download component' do
      let(:attributes) do
        { download_block: double(content: '<a>some content</a>') }
      end

      it 'renders download component view' do
        expect(view).to receive(:render).with(
          'components/download',
          content: ['<a class="download-box__list-item-link">some content</a>']
        )
        presenter.download_component
      end
    end

    context 'when object does not have download component' do
      let(:attributes) do
        { download_block: double(content: '') }
      end

      it 'does not render the component' do
        expect(view).to_not receive(:render)
        presenter.download_component
      end
    end
  end

  describe '#cta_links_component' do
    context 'when object has cta links component' do
      let(:attributes) do
        { cta_links_block: double(content: '<a>some content</a>') }
      end

      it 'renders cta component view' do
        expect(view).to receive(:render).with(
          'components/cta_links',
          content: ['<a>some content</a>']
        )
        presenter.cta_links_component
      end
    end

    context 'when object does not have cta links component' do
      let(:attributes) do
        { cta_links_block: double(content: '') }
      end

      it 'does not render the component' do
        expect(view).to_not receive(:render)
        presenter.cta_links_component
      end
    end
  end

  describe '#feedback_component' do
    context 'when object has feedback component' do
      let(:feedback_content) do
        double(content: '<p>email@moneyadviceservice.org.uk</p>')
      end
      let(:attributes) do
        {
          feedback_block: feedback_content
        }
      end

      it 'renders download component view' do
        expect(view).to receive(:render).with(
          'components/feedback',
          content: 'email@moneyadviceservice.org.uk'
        )
        presenter.feedback_component
      end
    end

    context 'when object does not have feedback component' do
      let(:attributes) do
        { feedback_block: nil }
      end

      it 'does not render the component' do
        expect(view).to_not receive(:render)
        presenter.feedback_component
      end
    end
  end

  describe '#overview_content' do
    context 'when object has overview content' do
      let(:attributes) do
        {
          overview_block: double(content: '<p>overview content</p>')
        }
      end

      it 'returns the hero image content without tags' do
        expect(presenter.overview_content).to eq('overview content')
      end
    end

    context 'when object does not have overview content' do
      let(:attributes) do
        { overview_block: nil }
      end

      it 'returns empty' do
        expect(presenter.overview_content).to be_empty
      end
    end
  end

  describe '#page_title' do
    let(:attributes) { {} }
    context 'when a page title has been specified' do
      let(:page_title) { 'Foo' }

      it 'returns the page title concatenated with the fincap page title' do
        expect(presenter.page_title(page_title)).to eq(
          'Foo | Financial Capability Strategy for the UK'
        )
      end
    end

    context 'when no page title has been specified' do
      let(:page_title) { nil }

      it 'returns nil' do
        expect(presenter.page_title(page_title)).to eq(nil)
      end
    end
  end
end
