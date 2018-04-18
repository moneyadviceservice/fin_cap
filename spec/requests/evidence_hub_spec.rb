RSpec.describe 'Evidence Hub Summaries', type: :request do
  describe 'GET /evidence_hub' do
    context 'arriving on the Evidence Hub page' do
      before { get '/en/evidence_hub' }

      it 'responds successful' do
        expect(response).to be_ok
      end
    end

    context 'searching with filters' do
      let(:params) do
        {
          evidence_summary_search_form:
            {
              keyword: '',
              'year_of_publication' => 'All years',
              'client_groups' => ['Young people (12 - 16)', 'Parents/families']
            }
        }
      end

      it 'arranges for the filter params to be formatted' do
        expect(SearchFormParamParser)
          .to receive(:parse)
          .with(params[:evidence_summary_search_form])

        get "/en/evidence_hub/?#{params.to_query}"
      end
    end
  end
end
