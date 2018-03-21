RSpec.describe EvidenceHubSearchFormPresenter do
  let(:view) { ActionView::Base.new }
  let(:search_form) do
    double('EvidenceHubSearchForm', attributes)
  end
  subject(:presenter) { described_class.new(search_form, view) }
  let(:attributes) { {} }

  before do
    allow(search_form).to receive(:class).and_return(EvidenceHubSearchForm)
  end

  describe '#filter_options' do
    let(:filter_type) { :client_groups }
    it 'creates filter option instances for the filter type\'s values' do
      filter_option_values = [
        'Children (3 - 11)',

  describe '#client_group_options' do
    it 'returns an array with all the options' do
      expected_result = [
        'Childrens (3 - 11)',

        'Young people (12 - 16)',
        'Parents / families',
        'Young adults (17 - 24)',
        'Working age (18 - 65)',
        'Older people (65+)',
        'Over-indebted people',
        'Social housing tenants',
        'Teachers / practitioners',
        'Other'
      ]

      filter_option_values.each_with_index do |option, index|
        expect(
          presenter.filter_options(filter_type)[index].value
        ).to eq(filter_option_values[index])
      end
    end
  end

  describe '#class_name' do
    it 'formats the class name with underscores' do
      expect(presenter.class_name).to eq('evidence_hub_search_form')
    end
  end
end
