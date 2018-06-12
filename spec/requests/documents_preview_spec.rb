RSpec.describe 'Previewing documents', type: :request do
  describe 'GET /:page_type/:id/preview' do
    let(:id) { 'changing-behaviour-around-online-transactions' }

    context 'supported page type: evaluations' do
      it 'responds successfully' do
        get "/en/evaluations/#{id}/preview"
        expect(response).to be_ok
      end
    end

    context 'supported page type: thematic_reviews' do
      let(:id) { 'how-can-we-improve-the-financial-capability-of-young-adults' }

      it 'responds successfully' do
        get "/en/thematic_reviews/#{id}/preview"
        expect(response).to be_ok
      end
    end

    context 'supported page type: thematic_reviews_landing_pages' do
      it 'responds successfully' do
        get '/en/thematic_reviews_landing_pages/thematic_reviews/preview'
        expect(response).to be_ok
      end
    end

    context 'unsupported page type' do
      it 'raises an ActionController RoutingError' do
        expect { get "/en/pages/#{id}/preview" }
          .to raise_error(ActionController::RoutingError)
      end
    end
  end
end
