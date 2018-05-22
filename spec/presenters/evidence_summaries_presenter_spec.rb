RSpec.describe EvidenceSummariesPresenter do
  let(:view) { ActionView::Base.new }
  let(:evidence_summaries) { double('Mas::Cms::ResultCollection', attributes) }
  let(:params) { {} }
  let(:attributes) { {} }
  subject(:presenter) { described_class.new(evidence_summaries, view) }

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
