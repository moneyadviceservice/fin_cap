RSpec.describe 'Evidence Hub Summaries', type: :request do
  describe 'GET /evidence_hub' do
    context 'arriving on the Evidence Hub page' do
      it 'responds successful' do
        get '/en/evidence_hub'
        expect(response).to be_ok
      end

      it 'sends the evidence hub document types' do
        expect(Mas::Cms::Document).to receive(:all).with(
          params: { document_type: ['Insight'] }
        ).and_return([])
        get '/en/evidence_hub'
      end
    end

    context 'searching with filters' do
      let(:params) do
        {
          evidence_summary_search_form: {
            keyword: '',
            year_of_publication: 'All years',
            client_groups: ['Young people (12 - 16)', 'Parents/families']
          }
        }
      end

      let(:expected_params) do
        {
          document_type: ['Insight'],
          'keyword' => '',
          blocks: [
            {
              identifier: 'client_groups',
              value: 'Young people (12 - 16)'
            },
            {
              identifier: 'client_groups',
              value: 'Parents/families'
            }
          ]
        }
      end

      it 'converts params to send to CMS' do
        expect(Mas::Cms::Document)
          .to receive(:all)
          .with(params: expected_params)
          .and_return([])

        get '/en/evidence_hub/', params: params
      end
    end

    context 'when clear all filters' do
      it 'sends the evidence hub document types' do
        expect(Mas::Cms::Document).to receive(:all).with(
          params: { document_type: ['Insight'], keyword: '' }
        ).and_return([])

        get '/en/evidence_hub', params: { reset: true }
      end
    end
  end
end
