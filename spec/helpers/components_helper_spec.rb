RSpec.describe ComponentsHelper do
  describe '#strategy_path' do
    context 'for devolved nations' do
      let(:country) { { region: 'scotland', slug: 'scotland-slug' } }
      it 'returns a regional_strategies path formatted with locale and slug' do
        expect(helper.strategy_path(country)).to eq(
          '/en/regional_strategies/scotland-slug'
        )
      end
    end

    context 'for united kingdom' do
      let(:country) { { region: 'uk', slug: 'uk-slug' } }
      it 'returns a uk_strategies path formatted with locale and slug' do
        expect(helper.strategy_path(country)).to eq('/en/uk_strategies/uk-slug')
      end
    end
  end

  describe '#define_path' do
    context 'for article pages' do
      let(:page_link) { { page_type: 'foo', slug: 'some-slug' } }
      it 'returns an article path formatted with locale and slug' do
        expect(helper.define_path(page_link)).to eq(
          '/en/articles/some-slug'
        )
      end
    end

    context 'for static pages' do
      let(:page_link) { { page_type: 'static', slug: 'impact-principles' } }
      it 'returns a static_pages path actioned to the slug' do
        expect(helper.define_path(page_link)).to eq('/en/impact-principles')
      end
    end
  end
end
