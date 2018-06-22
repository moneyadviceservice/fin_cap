RSpec.describe NewsTemplate do
  subject { described_class.new(news) }
  let(:news) do
    double('Mas::Cms::News', attributes)
  end

  describe '#order_by_date_block' do
    context 'when block is present' do
      let(:attributes) do
        {
          non_content_blocks: [
            Mas::Cms::Block.new(
              identifier: 'order_by_date',
              content: Date.new(2018, 6, 25)
            )
          ]
        }
      end

      it 'returns order_by_date_block' do
        expect(subject.order_by_date_block).to eq(
          Mas::Cms::Block.new(
            identifier: 'order_by_date',
            content: Date.new(2018, 6, 25)
          )
        )
      end
    end

    context 'when block is not present' do
      let(:attributes) do
        { non_content_blocks: [] }
      end

      it 'returns nil' do
        expect(subject.order_by_date_block).to be_nil
      end
    end
  end
end
