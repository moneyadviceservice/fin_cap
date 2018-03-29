RSpec.describe FilterParser, type: :model do
  let(:subject) { described_class.new(filters) }
  
  describe '#parse' do
    context 'searching with multiple filters of the same type' do
      let(:filters) do
        {
          'client_groups'=>['', 'Young people (12 - 16)', 'Parents/families']
        }
      end

      let(:expected_result) do
        { 
          blocks:
          [
            { identifier: 'client_groups', value: 'Young people (12 - 16)' },
            { identifier: 'client_groups', value: 'Parents/families' }
          ]
        }
      end

      it 'formats the filter params correctly' do
        expect(subject.parse).to eq(expected_result)
      end  
    end

    context 'searching with multiple filters of different types' do
      let(:filters) do
        {
          'years_of_publication' => 'All years',
          'client_groups'=>['', 'Young people (12 - 16)', 'Parents/families']
        }
      end

      let(:expected_result) do
        { 
          blocks:
          [
            { identifier: 'years_of_publication', value: 'All years' },
            { identifier: 'client_groups', value: 'Young people (12 - 16)' },
            { identifier: 'client_groups', value: 'Parents/families' }
          ]
        }
      end

      it 'formats the filter params correctly' do
        expect(subject.parse).to eq(expected_result)
      end
    end
  end
end
