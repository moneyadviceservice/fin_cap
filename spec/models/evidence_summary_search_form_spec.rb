RSpec.describe EvidenceSummarySearchForm do
  subject(:search_form) { described_class.new }

  describe '#chosen_options' do
    context 'when an option has been chosen' do
      it 'returns true' do
        search_form.years_of_publication = ['All years', 'Last 2 years']
        expect(search_form.chosen_options?(
                 'Last 2 years', :years_of_publication
        )).to be_truthy
      end
    end

    context 'when no options have been chosen' do
      it 'returns false' do
        expect(search_form.chosen_options?(
                 'All years', :years_of_publication
        )).to be_falsey
      end
    end
  end

  describe '#checkbox_filters' do
    it 'returns an array of the multi-select filters' do
      filters = %w[client_groups topics countries_of_delivery]
      expect(search_form.checkbox_filters).to eq(filters)
    end
  end

  describe '#radio_button_filters' do
    it 'returns an array of the single-select filters' do
      expect(search_form.radio_button_filters).to eq(['years_of_publication'])
    end
  end

  describe '#filter_title' do
    context 'when the first word is plural' do
      it 'converts snake case to a heading with the first word singularised' do
        filter = 'years_of_publication'
        expect(search_form.filter_title(filter)).to eq('Year of publication')
      end
    end

    context 'when the second word is plural' do
      filter = 'client_groups'
      it 'converts snake case to a heading with the second word singularised' do
        expect(search_form.filter_title(filter)).to eq('Client group')
      end
    end
  end
end
