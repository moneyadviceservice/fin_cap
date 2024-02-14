RSpec.describe UkStrategyTemplatePresenter do
  subject(:presenter) { described_class.new(object, view) }

  let(:view) { ActionView::Base.new(ActionView::LookupContext.new(nil), {}, nil) }
  let(:object) do
    instance_double(UkStrategyTemplate, attributes)
  end

  describe '#regional_strategy_title_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          regional_strategy_title_block: double(content: '<p>Title</p>')
        }
      end

      it 'returns the regional strategy title' do
        expect(presenter.regional_strategy_title_component).to eq(
          'Title'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { regional_strategy_title_block: nil }
      end

      it 'returns blank' do
        expect(presenter.regional_strategy_title_component).to be_blank
      end
    end
  end

  describe '#regional_strategy_link_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          regional_strategy_link_block: double(
            content: '<p><a href="path">text</a></p>'
          )
        }
      end

      it 'returns an array with the regional strategy text and path' do
        expect(presenter.regional_strategy_link_component).to eq(
          %w[text path]
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { regional_strategy_link_block: nil }
      end

      it 'returns blank' do
        expect(presenter.regional_strategy_link_component).to be_blank
      end
    end
  end

  describe '#regional_strategy_text_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          regional_strategy_text_block: double(content: '<p>Text</p>')
        }
      end

      it 'returns the regional strategy text' do
        expect(presenter.regional_strategy_text_component).to eq(
          'Text'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { regional_strategy_text_block: nil }
      end

      it 'returns blank' do
        expect(presenter.regional_strategy_text_component).to be_blank
      end
    end
  end
end
