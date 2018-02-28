RSpec.describe 'Evidence Hub Summaries', type: :request do
  describe 'GET /evidence_hub' do
    before do
      get '/en/evidence_hub'
    end

    it 'responds successful' do
      expect(response).to be_ok
    end
  end
end
