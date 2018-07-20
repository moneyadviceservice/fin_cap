RSpec.describe RegionalStrategyTemplatePresenter do
  let(:view) { ActionView::Base.new }
  let(:object) do
    double('RegionalStrategyTemplate', attributes)
  end
  subject(:presenter) { described_class.new(object, view) }

  describe '#forum_title_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          forum_title_block: double(content: '<p>Forum</p>')
        }
      end

      it 'returns the forum title' do
        expect(presenter.forum_title_component).to eq(
          'Forum'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { forum_title_block: nil }
      end

      it 'returns empty' do
        expect(presenter.forum_title_component).to be_empty
      end
    end
  end

  describe '#forum_links_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          forum_links_block: double(
            content: '<p><a href="href1">text1</a><a href="href2">text2</a><p>'
          )
        }
      end

      it 'returns array of hashes containing link attributes' do
        expected_result = [
          { href: 'href1', text: 'text1' },
          { href: 'href2', text: 'text2' }
        ]

        expect(presenter.forum_links_component).to eq(
          expected_result
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { forum_links_block: double(content: '') }
      end

      it 'returns empty' do
        expect(presenter.forum_links_component).to be_empty
      end
    end
  end

  describe '#strategy_text_component' do
    context 'when object has the block' do
      let(:attributes) do
        {
          strategy_text_block: double(content: '<p>Strategy text</p>')
        }
      end

      it 'returns the strategy text content' do
        expect(presenter.strategy_text_component).to eq(
          'Strategy text'
        )
      end
    end

    context 'when object does not have the block' do
      let(:attributes) do
        { strategy_text_block: nil }
      end

      it 'returns empty' do
        expect(presenter.strategy_text_component).to be_empty
      end
    end
  end
end
