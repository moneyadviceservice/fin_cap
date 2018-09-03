RSpec.describe TaggedNews, type: :model do
  let(:subject) { described_class.all(page) }

  describe '.all' do
    let(:page) { double('page', slug: 'homepage', tags: %w[one two]) }
    let(:financial_capability_week) do
      double('news', slug: 'financial-capability-week')
    end
    let(:news) { [page, financial_capability_week] }

    it 'retrieves all the news for the page' do
      expect(Mas::Cms::News).to receive(:all).with(
        params: {
          document_type: ['news'],
          tag: %w[one two],
          order_by_date: true
        }
      ).and_return(news)

      expect(subject).to eq([financial_capability_week])
    end
  end
end
