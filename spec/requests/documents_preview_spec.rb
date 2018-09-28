RSpec.describe 'Previewing documents', type: :request do
  describe 'GET /:page_type/:id/preview' do
    let(:id) { 'changing-behaviour-around-online-transactions' }

    context 'supported page type: evaluations' do
      it 'responds successfully' do
        get "/en/evaluations/#{id}/preview"
        expect(response).to be_ok
      end
    end

    context 'supported page type: news' do
      let(:id) { 'how-can-we-improve-the-financial-capability-of-young-adults' }

      it 'responds successfully' do
        get "/en/news/#{id}/preview"
        expect(response).to be_ok
      end
    end

    context 'unsupported page type' do
      it 'raises an ActionController RoutingError' do
        get "/en/pages/#{id}/preview"
        expect(response).to redirect_to not_found_path
      end
    end
  end
end
