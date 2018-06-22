RSpec.describe NewsTemplatePresenter do
  let(:view) { ActionView::Base.new }
  let(:object) do
    double('NewsTemplate', attributes)
  end
  subject(:presenter) { described_class.new(object, view) }

  describe '#news_cta_links_component' do
    context 'when object has cta links block' do
      let(:attributes) do
        {
          cta_links_block: double(
            content: '<p><a href="/latest_news">Latest news</a></p>'
          )
        }
      end

      it 'renders download component view' do
        expected_result = [{ href: '/latest_news', text: 'Latest news' }]
        expect(presenter.news_cta_links_component).to eq(expected_result)
      end
    end

    context 'when object does not have cta links component' do
      let(:attributes) do
        { cta_links_block: double(content: '') }
      end

      it 'does not render the component' do
        expect(view).to_not receive(:render)
        presenter.news_cta_links_component
      end
    end
  end

  describe '#order_by_date_component' do
    context 'when object has order_by date' do
      let(:attributes) do
        {
          order_by_date_block: double(
            content: "<p>#{Date.new(2018, 6, 25)}</p>"
          )
        }
      end

      it 'returns the order_by date content' do
        expect(presenter.order_by_date_component).to eq(
          'Monday 25 June 2018'
        )
      end
    end

    context 'when object does not have order_by date block' do
      let(:attributes) do
        { order_by_date_block: nil }
      end

      it 'returns empty' do
        expect(presenter.order_by_date_component).to be_empty
      end
    end
  end
end
