RSpec.describe 'Cookie policy acceptance', type: :request do
  describe 'POST /cookie_policy_acceptances' do
    context 'when request format is html' do
      context 'when there is a referer' do
        before do
          post '/cookie_policy_acceptances',
               headers: { 'HTTP_REFERER' => '/previous_page' }
        end

        it 'redirects to the previous page' do
          expect(response).to redirect_to('/previous_page')
        end
      end

      context 'when there is no referer' do
        before do
          post '/cookie_policy_acceptances'
        end

        it 'redirects to the root page' do
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end
end
