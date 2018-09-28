RSpec.describe 'Error handling', type: :request do
  context 'undefined route' do
    it 'redirects to not found' do
      get '/asdf'
      expect(response).to redirect_to not_found_path
    end
  end

  context 'non existent cms article' do
    it 'redirects to not found' do
      get '/en/articles/rubbish'
      expect(response).to redirect_to not_found_path
    end
  end
end
