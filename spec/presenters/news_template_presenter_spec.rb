RSpec.describe NewsTemplatePresenter do
  let(:view) { ActionView::Base.new(ActionView::LookupContext.new(nil), {}, nil) }
  let(:object) do
    double('BaseTemplate', attributes)
  end
  subject(:presenter) { described_class.new(object, view) }

  describe '#cta_links_component' do
    context 'when object has cta links component' do
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
