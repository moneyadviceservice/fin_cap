RSpec.describe HtmlParser, type: :model do
  let(:subject) { described_class.new(params) }

  describe '#extract_links' do
    context 'with a string of html anchor tag nested in a paragraph' do
      let(:params) { '<p><a href="/some+link+url.pdf">Some text</a></p>' }

      it 'returns the keyword hash' do
        expect(subject.extract_links).to eq(
          [{ text: 'Some text', href: '/some+link+url.pdf' }]
        )
      end
    end

    context 'with random string' do
      let(:params) { { keyword: '<p"/some+link+url.pdf">Some text</p>' } }

      it 'returns the keyword hash' do
        expect(subject.extract_links).to eq([])
      end
    end
  end
end
