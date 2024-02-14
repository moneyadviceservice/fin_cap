RSpec.describe EvidenceSummaryPresenter do
  let(:view) { ActionView::Base.new(ActionView::LookupContext.new(nil), {}, nil) }
  let(:evidence_summary) do
    double('EvidenceSummary', attributes)
  end
  subject(:presenter) { described_class.new(evidence_summary, view) }
  let(:attributes) { {} }

  describe 'delegated methods' do
    let(:document) { double('Mas::Cms::EvidenceSummary') }

    context '#meta_title' do
      it 'delegates to object' do
        expect(evidence_summary)
          .to receive(:document)
          .and_return(document)

        expect(document)
          .to receive(:meta_title)

        presenter.meta_title
      end
    end

    context '#meta_description' do
      it 'delegates to object' do
        expect(evidence_summary)
          .to receive(:document)
          .and_return(document)

        expect(document)
          .to receive(:meta_description)

        presenter.meta_description
      end
    end
  end

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

  describe '#data_type_definitions' do
    context 'when evidence type is insight' do
      let(:attributes) do
        { evidence_type: 'Insight' }
      end

      it 'returns array of hashes for the different data_types' do
        # rubocop:disable Metrics/LineLength
        qualitative_def = 'Qualitative research is more exploratory, and uses a range of methods like interviews, focus groups and observation to gain a deeper understanding about specific issues - such as people’s experiences, behaviours and attitudes.'
        quantitative_def = 'Quantitative research uses statistical or numerical analysis of survey data to answer questions about how much, how many, how often or to what extent particular characteristics are seen in a population. It is often used to look at changes over time and can identify relationships between characteristics like people’s attitudes and behaviours.'
        # rubocop:enable Metrics/LineLength
        expect(presenter.data_type_definitions).to match_array(
          [
            { keyword: 'Qualitative', definition: qualitative_def },
            { keyword: 'Quantitative', definition: quantitative_def }
          ]
        )
      end
    end

    context 'when evidence type evaluation' do
      let(:attributes) do
        { evidence_type: 'Evaluation' }
      end

      it 'returns array of hashes for the different data_types' do
        expect(presenter.data_type_definitions).to match_array(
          [
            # rubocop:disable Metrics/LineLength
            { keyword: 'Programme Theory', definition: 'Information about the programme design and rationale' },
            { keyword: 'Measured Outcomes', definition: 'Evidence about Financial Capability outcomes for programme participants' },
            { keyword: 'Causality', definition: 'Evidence that the Financial Capability outcomes were caused by the programme' },
            { keyword: 'Process Evaluation', definition: 'Evidence about programme implementation, feasibility, and piloting' },
            { keyword: 'Value for money', definition: 'Evidence about relative costs and benefits of the programme' }
            # rubocop:enable Metrics/LineLength
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

  describe '#client_group_filter_params' do
    it 'returns a hash of search params with the given value' do
      expected_result = {
        'evidence_summary_search_form' => {
          'client_groups' => ['Foo']
        }
      }

      expect(presenter.client_group_filter_params('foo')).to eq expected_result
    end
  end

  describe '#topic_filter_params' do
    it 'returns a hash of search params with the given value' do
      expected_result = {
        'evidence_summary_search_form' => {
          'topics' => ['Bar']
        }
      }

      expect(presenter.topic_filter_params('bar')).to eq expected_result
    end
  end

  describe '#new_css_class' do
    before do
      allow(evidence_summary).to receive(:recent?).and_return(recent?)
    end

    context 'when the evidence_summary is recently created' do
      let(:recent?) { true }

      it 'returns "is_new"' do
        expect(presenter.new_css_class).to eq('is-new')
      end
    end

    context 'when the evidence_summary has been around for awhile' do
      let(:recent?) { false }

      it 'returns an empty string' do
        expect(presenter.new_css_class).to eq('')
      end
    end
  end
end
