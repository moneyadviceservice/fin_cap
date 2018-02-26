RSpec.describe StyleguideController do
  describe 'GET /styleguide/:page' do
    context 'when :page params is valid' do
      before do
        get :show, params: { page: 'colours' }
      end

      it 'responds successfully' do
        expect(response).to be_ok
      end
    end

    context 'when :page params is invalid' do
      before do
        get :show, params: { page: '/etc/passwd' }
      end

      it 'returns "Not Found"' do
        expect(response.status).to be(404)
      end
    end
  end
end
