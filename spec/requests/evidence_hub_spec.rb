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
          evidence_hub_search_form:
            {
              'years_of_publication' => 'All years',
              'client_groups'=>['', 'Young people (12 - 16)', 'Parents/families']
            }
        }
      end

      it 'formats the filter params correctly' do
        expect(Mas::Cms::Document).to receive(:all)
          .with(params: formatted_filters)
          .and_return([])

        get "/en/evidence_hub/?#{filters.to_query}"
      end
    end
  end

  def formatted_filters
    { 
      locale: 'en',
      document_type: ['Insight'],
      blocks:
      [
        { identifier: 'years_of_publication', value: 'All years' },
        { identifier: 'client_groups', value: 'Young people (12 - 16)' },
        { identifier: 'client_groups', value: 'Parents/families' }
      ]
    }
  end
end
