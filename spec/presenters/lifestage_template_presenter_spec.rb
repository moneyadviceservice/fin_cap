RSpec.describe LifestageTemplatePresenter do
  let(:view) { ActionView::Base.new(ActionView::LookupContext.new(nil), {}, nil) }
  let(:object) do
    double('LifestageTemplate', attributes)
  end
  subject(:presenter) { described_class.new(object, view) }

  describe '#steering_group_title_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          steering_group_title_block: double(content: '<p>Steering group</p>')
        }
      end

      it 'returns the steering group title' do
        expect(presenter.steering_group_title_component).to eq(
          'Steering group'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { steering_group_title_block: nil }
      end

      it 'returns empty' do
        expect(presenter.steering_group_title_component).to be_empty
      end
    end
  end

  describe '#steering_group_links_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          steering_group_links_block: double(
            content: '<p><a href="href1">text1</a><a href="href2">text2</a><p>'
          )
        }
      end

      it 'returns array of hashes containing link attributes' do
        expected_result = [
          { href: 'href1', text: 'text1' },
          { href: 'href2', text: 'text2' }
        ]

        expect(presenter.steering_group_links_component).to eq(
          expected_result
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { steering_group_links_block: double(content: '') }
      end

      it 'returns empty' do
        expect(presenter.steering_group_links_component).to be_empty
      end
    end
  end

  describe '#strategy_overview_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          strategy_overview_block: double(content: '<p>Strategy overview</p>')
        }
      end

      it 'returns the strategy overview content' do
        expect(presenter.strategy_overview_component).to eq(
          'Strategy overview'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { strategy_overview_block: nil }
      end

      it 'returns empty' do
        expect(presenter.strategy_overview_component).to be_empty
      end
    end
  end
end
