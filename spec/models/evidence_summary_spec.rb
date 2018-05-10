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

  describe '#content' do
    let(:attributes) do
      {
        'blocks' => [
          {
            'identifier' => 'content',
            'content' => 'Stress caused by pay levels ...'
          }
        ]
      }
    end

    it 'returns the content value for block content identifier' do
      expect(evidence_summary.content).to eq('Stress caused by pay levels ...')
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

  describe '#links_to_research' do
    context 'when links are present' do
      let(:blocks) do
        [
          {
            'identifier' => 'links_to_research',
            'content' => '<a>Some link</a>'
          }
        ]
      end

      it 'returns links content' do
        expect(evidence_summary.links_to_research).to eq('<a>Some link</a>')
      end
    end

    context 'when links are not present' do
      it 'returns empty content' do
        expect(evidence_summary.links_to_research).to eq('')
      end
    end
  end

  describe '#contact_information' do
    context 'when contact is present' do
      let(:blocks) do
        [
          {
            'identifier' => 'contact_information',
            'content' => 'Tel: 7070707070'
          }
        ]
      end

      it 'returns contact information content' do
        expect(evidence_summary.contact_information).to eq('Tel: 7070707070')
      end
    end

    context 'when contact is not present' do
      it 'returns empty content' do
        expect(evidence_summary.contact_information).to eq('')
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

  describe '#activities_and_setting' do
    context 'when node is present' do
      let(:blocks) do
        [
          {
            'identifier' => 'activities_and_setting',
            'content' => 'some content'
          }
        ]
      end

      it 'returns content' do
        expect(evidence_summary.activities_and_setting).to eq('some content')
      end
    end

    context 'when node is not present' do
      it 'returns empty content' do
        expect(evidence_summary.activities_and_setting).to eq('')
      end
    end
  end

  describe '#programme_delivery' do
    context 'when node is present' do
      let(:blocks) do
        [
          {
            'identifier' => 'programme_delivery',
            'content' => 'Some company'
          }
        ]
      end

      it 'returns content' do
        expect(evidence_summary.programme_delivery).to eq('Some company')
      end
    end

    context 'when node is not present' do
      it 'returns empty content' do
        expect(evidence_summary.programme_delivery).to eq('')
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

  describe '#client_group' do
    context 'when client groups are present' do
      let(:blocks) do
        [
          { 'identifier' => 'client_groups', 'content' => 'Older people' },
          { 'identifier' => 'client_groups', 'content' => 'Working age' }
        ]
      end

      it 'returns client groups content' do
        expect(evidence_summary.client_group).to match_array(
          ['Older people', 'Working age']
        )
      end
    end

    context 'when client groups are not present' do
      it 'returns empty content' do
        expect(evidence_summary.client_group).to be_empty
      end
    end
  end

  describe '#measured_outcomes' do
    context 'when nodes are present' do
      let(:blocks) do
        [
          { 'identifier' => 'measured_outcomes', 'content' => '1' },
          { 'identifier' => 'measured_outcomes', 'content' => '2' }
        ]
      end

      it 'returns all content' do
        expect(evidence_summary.measured_outcomes).to match_array(%w[1 2])
      end
    end

    context 'when nodes are not present' do
      it 'returns empty content' do
        expect(evidence_summary.measured_outcomes).to be_empty
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

  describe '#data_types' do
    context 'when data_types are present' do
      let(:blocks) do
        [
          { 'identifier' => 'data_types', 'content' => 'qualitative' },
          { 'identifier' => 'data_types', 'content' => 'quantitative' }
        ]
      end

      it 'returns data_types content' do
        expect(evidence_summary.data_types).to match_array(
          %w[qualitative quantitative]
        )
      end
    end

    context 'when data_types are not present' do
      it 'returns empty content' do
        expect(evidence_summary.data_types).to be_empty
      end
    end
  end
end
