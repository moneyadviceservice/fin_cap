RSpec.describe 'Evidence Hub Summaries', type: :request do
  describe 'GET /evidence_hub' do
    context 'arriving on the Evidence Hub page' do
      before { get '/en/evidence_hub' }

      it 'responds successful' do
        expect(response).to be_ok
      end
    end

    context 'searching with filters' do
      let(:filters) do
        {
          evidence_summary_search_form:
            {
              'years_of_publication' => 'All years',
              'client_groups' => ['Young people (12 - 16)', 'Parents/families']
            }
        }
      end

      it 'arranges for the filter params to be formatted' do
        expect(FilterParser)
          .to receive(:parse)
          .with(filters[:evidence_summary_search_form]).and_return({})

        get "/en/evidence_hub/?#{filters.to_query}"
      end
    end
  end
end
