RSpec.describe FilterOption do
  subject(:filter_option) { described_class.new(value) }
  
  describe '#underscore' do
    context 'for strings with brackets and dashes' do
      let(:value) { 'Young people (12 - 16)' }

      it 'strips them and adds underscores in place of spaces' do
        expect(filter_option.underscore).to eq('young_people')
      end
    end

    context 'for strings with slashes' do
      let(:value) { 'Parents / families' }

      it 'strips them and adds underscores in place of spaces' do
        expect(filter_option.underscore).to eq('parents_families')
      end
    end
  end
end
