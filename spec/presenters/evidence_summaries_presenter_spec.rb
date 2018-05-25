RSpec.describe EvidenceSummariesPresenter do
  let(:view) { ActionView::Base.new }
  let(:evidence_summaries) { double('Mas::Cms::ResultCollection', attributes) }
  let(:params) { {} }
  let(:attributes) { {} }
  subject(:presenter) { described_class.new(evidence_summaries, view) }

  describe 'thematic_review_message' do
    let(:view) { double(params: params) }

    context 'when params tag is present' do
      let(:params) do
        { tag: 'tag-name' }
      end

      context 'when there is no evidence summaries' do
        let(:attributes) do
          { collection: [] }
        end

        it 'does not render the thematic review message' do
          expect(view).to_not receive(:render).with('thematic_review_message')
          presenter.thematic_review_message
        end
      end

      context 'when there is evidence summaries' do
        let(:attributes) do
          { collection: [1, 2, 3] }
        end

        it 'renders thematic review message' do
          expect(view).to receive(:render).with('thematic_review_message')
          presenter.thematic_review_message
        end
      end
    end

    context 'when params tag is blank' do
      let(:params) { {} }

      it 'does not render the thematic review message' do
        expect(view).to_not receive(:render).with('thematic_review_message')
        presenter.thematic_review_message
      end
    end
  end

  describe '#first_page?' do
    context 'when first page' do
      let(:attributes) do
        { meta: { 'page' => 1 } }
      end

      it 'returns true' do
        expect(presenter).to be_first_page
      end
    end

    context 'when not first page' do
      let(:attributes) do
        { meta: { 'page' => 2 } }
      end

      it 'returns false' do
        expect(presenter).to_not be_first_page
      end
    end
  end

  describe '#last_page?' do
    context 'when last page' do
      let(:attributes) do
        { meta: { 'total_pages' => 5, 'page' => 5 } }
      end

      it 'returns true' do
        expect(presenter).to be_last_page
      end
    end

    context 'when not last page' do
      let(:attributes) do
        { meta: { 'total_pages' => 6, 'page' => 5 } }
      end

      it 'returns false' do
        expect(presenter).to_not be_last_page
      end
    end
  end
end
