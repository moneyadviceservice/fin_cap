RSpec.describe SearchFormParamParser, type: :model do
  let(:subject) { described_class.new(params) }
  
  describe '#parse' do
    context 'with a keyword and no filters' do
      let(:params) { { keyword: 'pension' } }

      it 'returns the keyword hash' do
        expect(subject.parse).to eq( {keyword: 'pension', blocks: [] } )
      end
    end

    context 'with no keyword and no filters' do
      let(:params) { { keyword: '' } }

      it 'returns the keyword hash' do
        expect(subject.parse).to eq( {keyword: '', blocks: [] } )
      end
    end

    context 'with no keyword and one filter' do
      let(:params) do 
        {
          keyword: '', 
          'client_groups' => ['Young people (12 - 16)']
        }
      end

      let(:expected_result) do
        {
          keyword: '',
          blocks:
          [
            { identifier: 'client_groups', value: 'Young people (12 - 16)' }
          ]
        }
      end

      it 'returns a hash with the keyword hash and the filters formatted' do
        expect(subject.parse).to eq(expected_result)
      end
    end

    context 'with no keyword and multiple filters of the same type' do
      let(:params) do 
        {
          keyword: '',
          'client_groups' => client_groups
        }
      end

      let(:client_groups) { ['Young people (12 - 16)', 'Parents/families'] }
      
      let(:expected_result) do
        {
          keyword: '',
          blocks:
          [
            { identifier: 'client_groups', value: 'Young people (12 - 16)' },
            { identifier: 'client_groups', value: 'Parents/families' }
          ]
        }
      end

      it 'returns a hash with the keyword hash and the filters formatted' do
        expect(subject.parse).to eq(expected_result)
      end
    end

    context 'with no keyword and multiple filters of different types' do
      let(:params) do 
        {
          keyword: '',
          'years_of_publication' => 'All years',
          'client_groups' => client_groups
        }
      end

      let(:client_groups) { ['Young people (12 - 16)', 'Parents/families'] }
      
      let(:expected_result) do
        {
          keyword: '',
          blocks:
          [
            { identifier: 'years_of_publication', value: 'All years' },
            { identifier: 'client_groups', value: 'Young people (12 - 16)' },
            { identifier: 'client_groups', value: 'Parents/families' }
          ]
        }
      end

      it 'returns a hash with the keyword hash and the filters formatted' do
        expect(subject.parse).to eq(expected_result)
      end
    end

    context 'with a keyword and multiple filters of different types' do
      let(:params) do 
        {
          keyword: 'pension',
          'years_of_publication' => 'All years',
          'client_groups' => client_groups
        }
      end

      let(:client_groups) { ['Young people (12 - 16)', 'Parents/families'] }
      
      let(:expected_result) do
        {
          keyword: 'pension',
          blocks:
          [
            { identifier: 'years_of_publication', value: 'All years' },
            { identifier: 'client_groups', value: 'Young people (12 - 16)' },
            { identifier: 'client_groups', value: 'Parents/families' }
          ]
        }
      end

      it 'returns a hash with the keyword hash and the filters formatted' do
        expect(subject.parse).to eq(expected_result)
      end
    end
  end
end
