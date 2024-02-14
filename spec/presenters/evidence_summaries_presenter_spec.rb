RSpec.describe EvidenceSummariesPresenter do
  let(:evidence_summaries) { double('Mas::Cms::ResultCollection', attributes) }
  let(:params) { {} }
  let(:attributes) { {} }
  let(:view) { ActionView::Base.new(ActionView::LookupContext.new(nil), {}, double(params: params)) }
  subject(:presenter) { described_class.new(evidence_summaries, view) }

  describe 'thematic_review_message' do

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

  describe '#pagination_description' do
    context 'when no results pages' do
      let(:attributes) do
        { meta: { 'total_pages' => 0 } }
      end

      it 'returns nil' do
        expect(presenter.pagination_description).to be_nil
      end
    end

    context 'when one results page' do
      let(:attributes) do
        { meta: { 'total_pages' => 1 } }
      end

      it 'returns nil' do
        expect(presenter.pagination_description).to be_nil
      end
    end

    context 'when two results pages' do
      let(:attributes) do
        { meta: { 'total_pages' => 2, 'page' => 1 } }
      end

      it 'returns pagination' do
        expect(presenter.pagination_description).to eq('Page 1 of 2')
      end
    end
  end

  describe '#previous_page' do
    context 'when no results pages' do
      let(:attributes) do
        { meta: { 'total_pages' => 0 } }
      end

      it 'returns nil' do
        expect(presenter.previous_page).to be_nil
      end
    end

    context 'when one results page' do
      let(:attributes) do
        { meta: { 'total_pages' => 1 } }
      end

      it 'returns nil' do
        expect(presenter.previous_page).to be_nil
      end
    end

    context 'when two results pages' do
      let(:attributes) do
        { meta: { 'total_pages' => 2, 'page' => 1 } }
      end

      it 'returns previous_page' do
        expect(presenter.previous_page).to eq(
          '<span class="pagination__prev-page is-disabled">&lt;</span>'
        )
      end
    end
  end

  describe '#next_page' do
    context 'when no results pages' do
      let(:attributes) do
        { meta: { 'total_pages' => 0 } }
      end

      it 'returns nil' do
        expect(presenter.next_page).to be_nil
      end
    end

    context 'when one results page' do
      let(:attributes) do
        { meta: { 'total_pages' => 1 } }
      end

      it 'returns nil' do
        expect(presenter.next_page).to be_nil
      end
    end

    context 'when two results pages' do
      let(:attributes) do
        { meta: { 'total_pages' => 2, 'page' => 2 } }
      end

      it 'returns next_page' do
        expect(presenter.next_page).to eq(
          '<span class="pagination__next-page is-disabled">&gt;</span>'
        )
      end
    end
  end
end
