RSpec.describe EvidenceHub::SearchFormParamParser, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  let(:subject) { described_class.new(params) }

  describe '#parse' do
    context 'with a keyword and no filters' do
      let(:params) { { keyword: 'pension' } }

      it 'returns the keyword hash' do
        expect(subject.parse).to eq(keyword: 'pension')
      end
    end

    context 'with no keyword and no filters' do
      let(:params) { { keyword: '' } }

      it 'returns the keyword hash' do
        expect(subject.parse).to eq(keyword: '')
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
          'topics' => ['Saving'],
          'client_groups' => client_groups
        }
      end

      let(:client_groups) { ['Young people (12 - 16)', 'Parents/families'] }

      let(:expected_result) do
        {
          keyword: '',
          blocks:
          [
            { identifier: 'topics', value: 'Saving' },
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
          'topics' => ['Saving'],
          'client_groups' => client_groups
        }
      end

      let(:client_groups) { ['Young people (12 - 16)', 'Parents/families'] }

      let(:expected_result) do
        {
          keyword: 'pension',
          blocks:
          [
            { identifier: 'topics', value: 'Saving' },
            { identifier: 'client_groups', value: 'Young people (12 - 16)' },
            { identifier: 'client_groups', value: 'Parents/families' }
          ]
        }
      end

      it 'returns a hash with the keyword hash and the filters formatted' do
        expect(subject.parse).to eq(expected_result)
      end
    end

    context 'with a publication year filter' do
      let(:filter) { 'year_of_publication' }

      before { travel_to Time.zone.local(2018, 8, 4, 1, 15, 30) }
      after { travel_back }

      context 'set to All years' do
        let(:params) { { keyword: '', filter => 'All years' } }
        let(:expected_result) { { keyword: '' } }

        it 'returns a hash with the keyword hash' do
          expect(subject.parse).to eq(expected_result)
        end
      end

      context 'set to Last 2 years' do
        let(:params) { { keyword: '', filter => 'Last 2 years' } }
        let(:expected_result) { { keyword: '', blocks: blocks } }
        let(:blocks) { [{ identifier: filter, value: years }] }
        let(:years) { [2018, 2017] }

        it 'returns an array of 2 year values and the keyword hash' do
          expect(subject.parse).to eq(expected_result)
        end
      end

      context 'set to Last 5 years' do
        let(:params) { { keyword: '', filter => 'Last 5 years' } }
        let(:expected_result) { { keyword: '', blocks: blocks } }
        let(:blocks) { [{ identifier: filter, value: years }] }
        let(:years) { [2018, 2017, 2016, 2015, 2014] }

        it 'returns array of 5 year values and the keyword hash' do
          expect(subject.parse).to eq(expected_result)
        end
      end

      context 'set to more than 5 years ago' do
        let(:params) { { keyword: '', filter => 'More than 5 years ago' } }
        let(:expected_result) { { keyword: '', blocks: blocks } }
        let(:blocks) { [{ identifier: filter, value: years }] }
        let(:years) { 2013.downto(2000).to_a }

        it 'returns array of years btwn (now - 5) to 2000 and keyword hash' do
          expect(subject.parse).to eq(expected_result)
        end
      end
    end

    context 'with a single measured outcome filter' do
      let(:params) { { 'measured_outcomes' => ['Foo'] } }

      let(:expected_result) do
        {
          blocks: [{ identifier: 'measured_outcomes', value: 'Foo' }]
        }
      end

      it 'returns a hash with the measured outcome values formatted' do
        expect(subject.parse).to eq(expected_result)
      end
    end

    context 'with a filter included in the list of ignored' do
      let(:params) do
        {
          'evidence_types' => ['Insight'],
          'topics' => ['Saving']
        }
      end

      it 'excludes it from the parsed output' do
        expect(subject.parse).to eq(
          blocks: [{ identifier: 'topics', value: 'Saving' }]
        )
      end
    end
  end
end
