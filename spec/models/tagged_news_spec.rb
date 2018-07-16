RSpec.describe TaggedNews, type: :model do
  let(:subject) { described_class.all(article) }

  describe '#all' do
    let(:article) { Mas::Cms::Lifestage.find('young-adults') }

    it 'does not return the article' do
      expect(subject.include?(article)).to be_falsey
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
        expect(subject.count).to eq(10)
      end
    end
  end
end
