RSpec.describe EvidenceSummary do
  subject(:evidence_summary) { described_class.new(document) }
  let(:document) do
    Mas::Cms::Document.new(1, { blocks: blocks }.merge(attributes))
  end
  let(:attributes) { {} }
  let(:blocks) { [] }

  describe '#title' do
    let(:attributes) { { 'label' => 'Financial well being' } }

    it 'returns label from document' do
      expect(evidence_summary.title).to eq('Financial well being')
    end
  end

  describe '#evidence_type' do
    context 'when layout identifier is present' do
      let(:attributes) { { 'layout_identifier' => 'insight' } }

      it 'returns layout identifier' do
        expect(evidence_summary.evidence_type).to eq('Insight')
      end
    end

    context 'when layout identifier is not present' do
      it 'returns layout identifier' do
        expect(evidence_summary.evidence_type).to eq('')
      end
    end
  end

  describe '#overview' do
    context 'when overview is present' do
      let(:blocks) do
        [
          { 'identifier' => 'overview', 'content' => 'overview content' }
        ]
      end

      it 'returns overview content' do
        expect(evidence_summary.overview).to eq('overview content')
      end
    end

    context 'when overview is not present' do
      it 'returns overview content' do
        expect(evidence_summary.overview).to eq('')
      end
    end
  end

  describe '#year_of_publication' do
    context 'when year of publication is present' do
      let(:blocks) do
        [
          { 'identifier' => 'year_of_publication', 'content' => '2017' }
        ]
      end

      it 'returns year of publication' do
        expect(evidence_summary.year_of_publication).to eq('2017')
      end
    end

    context 'when year of publication is not present' do
      it 'returns empty content' do
        expect(evidence_summary.year_of_publication).to eq('')
      end
    end
  end

  describe '#countries' do
    context 'when countries are present' do
      let(:blocks) do
        [
          { 'identifier' => 'countries', 'content' => 'United Kingdom' }
        ]
      end

      it 'returns countries content' do
        expect(evidence_summary.countries).to eq('United Kingdom')
      end
    end

    context 'when countries are not present' do
      it 'returns empty content' do
        expect(evidence_summary.countries).to eq('')
      end
    end
  end

  describe '#topics' do
    context 'when topics are present' do
      let(:blocks) do
        [
          { 'identifier' => 'topics', 'content' => 'Topics 1' },
          { 'identifier' => 'topics', 'content' => 'Topics 2' }
        ]
      end

      it 'returns topics content' do
        expect(evidence_summary.topics).to match_array(['Topics 1', 'Topics 2'])
      end
    end

    context 'when topics are not present' do
      it 'returns empty content' do
        expect(evidence_summary.topics).to be_empty
      end
    end
  end
end
