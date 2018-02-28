RSpec.describe EvidenceSummaryPresenter do
  let(:view) { ActionView::Base.new }
  let(:evidence_summary) do
    double('EvidenceSummary', attributes)
  end
  subject(:presenter) { described_class.new(evidence_summary, view) }

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

  describe '#evidence_type_info' do
    let(:attributes) do
      {
        evidence_type: 'Insight'
      }
    end

    it 'returns the evidence type of the document' do
      expect(presenter.evidence_type_info).to eq('Evidence type: Insight')
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

  describe '#stripped_topics' do
    let(:attributes) do
      {
        topics: ['<p>Saving</p>', '<p>Financial Capability</p>']
      }
    end

    it 'strips all html tags from topics' do
      expect(presenter.stripped_topics).to eq(
        'Topics: Saving, Financial Capability'
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
        'Country/Countries: United Kingdom'
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
        'Year of publication: 2017'
      )
    end
  end
end
