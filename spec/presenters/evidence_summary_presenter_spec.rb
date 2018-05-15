RSpec.describe EvidenceSummaryPresenter do
  let(:view) { ActionView::Base.new }
  let(:evidence_summary) do
    double('EvidenceSummary', attributes)
  end
  subject(:presenter) { described_class.new(evidence_summary, view) }
  let(:attributes) { {} }

  before do
    allow(evidence_summary).to receive(:class).and_return(EvidenceSummary)
  end

  describe '#link' do
    let(:attributes) do
      {
        title: 'Financial well-being: the employee view',
        full_path: '/en/insights/financial-well-being-the-employee-view'
      }
    end

    it 'returns link with title and full path' do
      expect(presenter.link).to include(
        '<a href="/en/insights/financial-well-being-the-employee-view">'
      )
      expect(presenter.link).to include(
        'Financial well-being: the employee view</a>'
      )
    end
  end

  describe '#client_group_field_name' do
    it 'returns the name of the field' do
      expect(presenter.client_group_field_name).to eq('Client group')
    end
  end

  describe '#evidence_type_field_name' do
    it 'returns the name of the field' do
      expect(presenter.evidence_type_field_name).to eq('Evidence type')
    end
  end

  describe '#topics_field_name' do
    it 'returns the name of the field' do
      expect(presenter.topics_field_name).to eq('Topics')
    end
  end

  describe '#year_of_publication_field_name' do
    it 'returns the name of the field' do
      expect(presenter.year_of_publication_field_name).to eq(
        'Year of publication'
      )
    end
  end

  describe '#contact_information_field_name' do
    it 'returns the name of the field' do
      expect(presenter.contact_information_field_name).to eq(
        'Contact information'
      )
    end
  end

  describe '#links_to_research_field_name' do
    it 'returns the name of the field' do
      expect(presenter.links_to_research_field_name).to eq(
        'Links to further information'
      )
    end
  end

  describe '#countries_field_name' do
    it 'returns the name of the field' do
      expect(presenter.countries_field_name).to eq('Country/Countries')
    end
  end

  describe '#formatted_topics' do
    let(:attributes) do
      {
        topics: ['One topic', 'Another topic']
      }
    end

    it 'returns the topics separated by comma' do
      expect(presenter.formatted_topics).to eq(
        'Topics: One topic, Another topic'
      )
    end
  end

  describe '#formatted_countries' do
    let(:attributes) do
      {
        countries: 'United Kingdom'
      }
    end

    it 'returns the countries with the field name' do
      expect(presenter.formatted_countries).to eq(
        'Country/Countries: United Kingdom'
      )
    end
  end

  describe '#formatted_year_of_publication' do
    let(:attributes) do
      {
        year_of_publication: '2017'
      }
    end

    it 'returns the evidence type of the document' do
      expect(presenter.formatted_year_of_publication).to eq(
        'Year of publication: 2017'
      )
    end
  end

  describe '#stripped_overview' do
    let(:attributes) do
      {
        overview: '<p>Nationally representative survey</p>'
      }
    end

    it 'strips all html tags from overview' do
      expect(presenter.stripped_overview).to eq(
        'Nationally representative survey'
      )
    end
  end

  describe '#stripped_programme_delivery' do
    let(:attributes) do
      {
        programme_delivery: '<p>Some company</p>'
      }
    end

    it 'strips all html tags from attribute' do
      expect(presenter.stripped_programme_delivery).to eq('Some company')
    end
  end

  describe '#stripped_client_group' do
    let(:attributes) do
      {
        client_group: ['<p>Working age</p>', '<p>Older people</p>']
      }
    end

    it 'strips all html tags from client groups' do
      expect(presenter.stripped_client_group).to eq(
        ['Working age', 'Older people']
      )
    end
  end

  describe '#stripped_measured_outcomes' do
    let(:attributes) do
      {
        measured_outcomes: [
          '<p>Financial capability (Mindset)</p>',
          '<p>Financial capability (Ability)</p>'
        ]
      }
    end

    it 'strips all html tags from attribute' do
      expect(presenter.stripped_measured_outcomes).to eq(
        ['Financial capability (Mindset)', 'Financial capability (Ability)']
      )
    end
  end

  describe '#stripped_topics' do
    let(:attributes) do
      {
        topics: ['<p>Saving</p>', '<p>Financial Capability</p>']
      }
    end

    it 'strips all html tags from topics' do
      expect(presenter.stripped_topics).to eq(
        ['Saving', 'Financial Capability']
      )
    end
  end

  describe '#stripped_countries' do
    let(:attributes) do
      {
        countries: '<p>United Kingdom</p>'
      }
    end

    it 'strips all html tags from countries' do
      expect(presenter.stripped_countries).to eq(
        'United Kingdom'
      )
    end
  end

  describe '#stripped_activities_and_setting' do
    let(:attributes) do
      {
        activities_and_setting: '<p>some content</p>'
      }
    end

    it 'strips all html tags from attribute' do
      expect(presenter.stripped_activities_and_setting).to eq(
        'some content'
      )
    end
  end

  describe '#stripped_year_of_publication' do
    let(:attributes) do
      {
        year_of_publication: '<p>2017</p>'
      }
    end

    it 'strips all html tags from year of publication' do
      expect(presenter.stripped_year_of_publication).to eq(
        '2017'
      )
    end
  end

  describe '#data_type_keys' do
    context 'when evidence type is insight' do
      let(:attributes) do
        { evidence_type: 'Insight' }
      end

      it 'returns an array of the different data_types' do
        expect(presenter.data_type_keys).to match_array(
          %w[Qualitative Quantitative]
        )
      end
    end

    context 'when evidence type evaluation' do
      let(:attributes) do
        { evidence_type: 'Evaluation' }
      end

      it 'returns an array of the different data_types' do
        expect(presenter.data_type_keys).to match_array(
          [
            'Programme Theory',
            'Measured Outcomes',
            'Causality',
            'Process Evaluation',
            'Value for money'
          ]
        )
      end
    end
  end

  describe '#data_type_icon' do
    let(:attributes) do
      { data_types: %w[qualitative] }
    end

    context 'when the data type is present' do
      it 'returns "tick"' do
        expect(presenter.data_type_icon('qualitative')).to eq('tick')
      end
    end

    context 'when the data type is absent' do
      it 'returns "cross"' do
        expect(presenter.data_type_icon('quantitative')).to eq('cross')
      end
    end
  end

  describe '#stripped_data_types' do
    let(:attributes) do
      {
        data_types: ["<p>Qualitative</p>\n"]
      }
    end

    it 'strips all html tags from year of publication' do
      expect(presenter.stripped_data_types).to eq(
        ['Qualitative']
      )
    end
  end
end
