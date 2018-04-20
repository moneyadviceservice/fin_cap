RSpec.describe ArticlePresenter do
  let(:view) { ActionView::Base.new }
  let(:article) do
    double('FincapArticle', attributes)
  end
  subject(:presenter) { described_class.new(article, view) }

  describe '#download_component' do
    context 'when article has download component' do
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

    context 'when article does not have download component' do
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
    context 'when article has cta links component' do
      let(:attributes) do
        { cta_links_block: double(content: '<a>some content</a>') }
      end

      it 'renders download component view' do
        expect(view).to receive(:render).with(
          'components/cta_links',
          content: ['<a>some content</a>']
        )
        presenter.cta_links_component
      end
    end

    context 'when article does not have cta links component' do
      let(:attributes) do
        { cta_links_block: double(content: '') }
      end

      it 'does not render the component' do
        expect(view).to_not receive(:render)
        presenter.cta_links_component
      end
    end
  end
end
