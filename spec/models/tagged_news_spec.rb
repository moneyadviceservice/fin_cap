RSpec.describe TaggedNews, type: :model do
  let(:subject) { described_class.all(article) }

  describe '#all' do
    let(:article) { Mas::Cms::Lifestage.find('young-adults') }

    it 'does not return the article' do
      expect(subject.include?(article)).to be_falsey
    end

    context 'sorting news by the published date' do
      let(:article) { Mas::Cms::Homepage.find('root') }
      let(:news_dates) do
        subject.map(&:published_date)
      end

      it 'sorts news by date' do
        expect(news_dates).to eq(
          [
            Date.new(2018, 11, 19),
            Date.new(2018, 10, 18),
            Date.new(2018, 9, 17),
            Date.new(2018, 8, 16),
            Date.new(2018, 7, 26),
            Date.new(2018, 7, 15),
            Date.new(2018, 6, 14),
            Date.new(2018, 5, 13),
            Date.new(2018, 4, 12),
            Date.new(2018, 3, 11),
            Date.new(2018, 2, 10),
            Date.new(2017, 3, 15)
          ]
        )
      end
    end

    context 'when the article has associated tags' do
      it 'returns news items with the same tags as the article' do
        subject.each do |news_item|
          expect(news_item.tags.any? { |tag| article.tags.include?(tag) })
            .to be_truthy
        end
      end
    end

    context 'when the article has no associated tags' do
      let(:article) { Mas::Cms::Article.find('uk-strategy') }

      it 'returns all the news items' do
        expect(subject.count).to eq(12)
      end
    end
  end
end
