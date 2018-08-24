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
end
