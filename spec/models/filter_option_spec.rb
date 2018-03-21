RSpec.describe FilterOption do
  subject(:filter_option) { described_class.new(value) }
  
  describe '#underscore' do
    context 'for strings with brackets and dashes' do
      let(:value) { 'Young people (12 - 16)' }

      it 'strips them and replaces spaces with underscores' do
        expect(filter_option.underscore).to eq('young_people')
      end
    end

    context 'for strings with slashes' do
      let(:value) { 'Parents / families' }

      it 'strips them and replaces spaces with underscores' do
        expect(filter_option.underscore).to eq('parents_families')
      end
    end

    context 'for strings with plus signs' do
      let(:value) { 'Older people (65+)' }

      it 'strips them and replaces spaces with underscores' do
        expect(filter_option.underscore).to eq('older_people')
      end
    end

    context 'for strings with dashes' do
      let(:value) { 'Over-indebted people' }

      it 'strips them and replaces spaces with underscores' do
        expect(filter_option.underscore).to eq('over_indebted_people')
      end
    end
  end
end
